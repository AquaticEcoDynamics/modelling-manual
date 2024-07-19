# Run this from the parent dir (replace gilesknight/aed-bookdown with your own
# tag):
# docker build -t gilesknight/aed-bookdown -f .devcontainer/Dockerfile .

FROM ubuntu:22.04

ENV R_VERSION="4.1.2" 
ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i.bak "/^#.*deb-src.*universe$/s/^# //g" /etc/apt/sources.list &&\
    apt update &&\
    apt build-dep r-base -y

RUN apt-get install -y \
    curl \
    locales \
    pandoc \
    pandoc-citeproc \
    gdal-bin \
    proj-bin \
    libgdal-dev \
    libproj-dev \
    git

RUN curl -O https://cran.rstudio.com/src/base/R-4/R-${R_VERSION}.tar.gz &&\
    tar -xzvf R-${R_VERSION}.tar.gz 

RUN cd R-${R_VERSION} &&\
    ./configure --prefix=/opt/R/${R_VERSION} \
    --enable-R-shlib --enable-memory-profiling --with-blas --with-lapack &&\
    make &&\
    make install

ENV PATH="/opt/R/${R_VERSION}/bin:${PATH}"

RUN R -e "install.packages('renv', repos='https://cran.rstudio.com/')"

COPY renv.lock /renv.lock

RUN R -e "renv::restore(lockfile = '/renv.lock')"

RUN rm -rf R-${R_VERSION}.tar.gz R-${R_VERSION}

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen &&\
    locale-gen en_US.UTF-8

