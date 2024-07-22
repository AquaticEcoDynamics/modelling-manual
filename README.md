# modelling-manual
Interactive manual for learning how to model environmental dynamics.

## Development 

### Docker 

A docker container/dev-container can be used to develop the bookdown project on
your local machine. To build the book inside this environment, run the 
following:

1) Launch the R console:

```
R
```

2) Synchronise the project library with the lockfile:

```
renv::restore()
```

3) Build the book:

```
bookdown::render_book("index.Rmd", "bookdown::gitbook")
```

If using VS Code, install the 'Live Server' extension in your development 
environment to preview a locally hosted version of the website. Open 
`docs/index.html` and the click the 'Go Live' button in the bottom right-hand 
corner of VS Code.

### Git

When commiting changes, avoid commiting any HTML/JS/CSS in the `docs` directory
that was generated when building the book locally (`.gitignore` will catch most 
of this for you). The only files that should be commited from the `docs` 
directory are:

- Module resources intended to be downloaded by the user, e.g.,
`Module 1 Resources.zip`.
- Images/videos in the `images` sub-directory that are displayed on the website.
- Data files in the `data` sub-directory that are used in R code chucks.

### Deployment

A GitHub Actions deployment workflow with build the book from scratch and add 
the generated website files to the root of the `gh-pages` branch.
This is where GitHub Pages looks when hosting the website.