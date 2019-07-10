# tocr: Add a table of contents (TOC) to an (R) Markdown file

tocr is an R package that allows to automatically add a table of contents (TOC) to (R) Markdown documents. Internal links are [compatible](vignettes/intro.html#toc-markdown_flavor) with HTML "anchors" (commonly referred to as _# links_ pointing to [HTML fragment identifiers](https://en.wikipedia.org/wiki/Fragment_identifier)) generated by sites like GitHub or GitLab when rendering the Markdown.

## Features

...

## Details

tocr uses the following two [HTML comments](https://www.w3schools.com/TAGS/tag_comment.asp) to mark the beginning and end of an auto-generated TOC:

```html
<!-- TOC BEGIN -- leave this comment untouched to allow auto update -->
```

```html
<!-- TOC END -- leave this comment untouched to allow auto update -->
```

tocr's `add_toc()` supports the comment format of [other similar software](#see-also) like [doctoc](https://github.com/thlorenz/doctoc). If you stumble upon software-generated Markdown TOCs which aren't recognized by `add_toc()`, feel free to [file an issue](http://gitlab.com/salim_b/tocr/issues) or even add support for it on your own and submit a [merge request](https://gitlab.com/salim_b/tocr/merge_requests).

## Installation

To install the latest development version of _tocr_, run the following in R:

```r
if ( !("remotes" %in% rownames(installed.packages())) )
{
  install.packages(pkgs = "remotes",
                   repos = "https://cloud.r-project.org/")
}
remotes::install_gitlab(repo = "salim_b/tocr")
```

## Development

This package is written using [literate programming](https://en.wikipedia.org/wiki/Literate_programming) techniques proposed by [Yihui Xie](https://yihui.name/rlp/). This means all the `-GEN.R` suffixed R source code found under [`R/`](R/) is generated from their respective [R Markdown](https://rmarkdown.rstudio.com/) counterparts found under [`Rmd/`](Rmd/) as instructed by the [`Makefile`](Makefile). Always make changes only to the `.Rmd` files – not the `.R` files – and then run the following from the root of this repository to regenerate the R source code and build and install the package:

```sh
make && Rscript -e "devtools::install('.', keep_source = TRUE)"
```

Make sure that [`make`](https://de.wikipedia.org/wiki/GNU_Make)[^make-windoof] is available on your system and that the R packages [`knitr`](https://cran.r-project.org/package=knitr) and [`rmarkdown`](https://cran.r-project.org/package=rmarkdown) are up to date beforehand.


[^make-windoof]: On Windows, `make` is included in [Rtools](https://cran.rstudio.com/bin/windows/Rtools/). On macOS, you have to install the [Xcode command line tools](https://stackoverflow.com/a/10301513/7196903).


## See also

- [doctoc](https://github.com/thlorenz/doctoc) for a similar solution to add TOCs to Markdown documents implemented in JavaScript. It served as some sort of inspiration for tocr.
- [Markdown TOC](https://github.com/nok/markdown-toc) for an [Atom](https://atom.io/) package that auto-generates TOCs.
- [remark-toc](https://github.com/remarkjs/remark-toc) for a TOC generator plugin for the JavaScript-based Markdown processor [remark](https://github.com/remarkjs/remark).
- [Tocdown](https://github.com/dohliam/tocdown) for another Markdown TOC generator written in JavaScript and Ruby.
