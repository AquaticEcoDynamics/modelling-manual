#Uncomment and run the lines below if you don't have the 'MASS' or 'fields' packages installed
#install.packages("MASS")
#install.packages("fields")
library(MASS)
library(fields)

riverposition2<-as.vector(t(riverposition)) #  Transpose space #
conc<-t(as.matrix(C[ 2:length(time),2:length(riverposition) ]))

par(mfrow=c(1,1), mar=c(3,3,1.7,1), mgp=c(1.6,0.5,0),  #Plot margins
    oma=c(0,0,0,0), lend="square", ljoin="mitre")
image.plot(riverposition2,time,conc,cex.lab=1.0,axes=T,
           xlab= expression(bold("Your x-axis label")),ylab=expression(bold("Your y-axis label")),ylim=c(min(time),max(time)),
           bigplot=c(0.1,0.7,0.1,0.86),smallplot=c(0.76,0.8,0.1,0.9),
           legend.lab = expression(bold("Your legend label")),
           zlim=c(0,10), #Controls the legend min/max
           col=topo.colors(n=100)  #Controls the colour scheme, try terrain.colors(n=300)
           )