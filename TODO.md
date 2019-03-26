# TODO

## stuff to finish

- [x] rename package to `tocr`
    - minor issue: there's another R package named [tocR](https://github.com/sambold/tocR/) to crawl TOR sites (not on CRAN) -> ideally its author would rename it to `torc`!

- [ ] remove Markdown footnotes from TOC entries; example: <https://gitlab.com/c2d-zda/i_voting_dataset/blob/master/ANALYSIS.md>

- [ ] finish intro-Vignette

- [ ] `add_toc()`: add description line and details (i.a. link to intro-Vignette)

- [ ] DESCRIPTION: overthink `Description` field.

- [x] generate notice about literate programming @ beginning of *-GEN.R files in Makefile

- [ ] set up some tests!
    - [ ] separate md documents for every feature without and with TOC --> running them through `add_toc()` needs to produce identical results!
    - [ ] huge mega md document (or several of them) without and with TOC --> running it through `add_toc()` needs to produce an identical result!
    - [ ] `handle_existing_toc()` --> TOC comment detection
        - see `/home/salim/Schreibtisch/Markdown TOC - comment format.jpg`

- [ ] Makefile/README.Rmd: instead of downloading the snippets everytime inside the README.Rmd, do it in the Makefile and only redownload if changed
    - see: <https://unix.stackexchange.com/questions/425297/how-can-i-use-files-from-http-as-prerequisites-in-gnu-make>

## Bugs

- [ ] fix handling of trailing `#` in header processing (adhere to <try.commonmark.org>)

- [ ] duplicated h1-header (generell strange), wenn `position` > 7 und < 27:

    ```
    readLines(con = "https://raw.githubusercontent.com/thlorenz/doctoc/1d386261972d35c6bcd187d0a00e666f9d893d8d/README.md") %>%
      add_toc(position = 15) %>%
        cat(sep = "\n")
    ```

## Features

- [ ] re-export magrittr's piping operators and update examples and intro vignette

- [ ] add `position = "existing"` and make it the default (maybe in combo with `"above"`, i.e. `position = c("existing", "above)`)
    This should just place the TOC at the exact same position as an already existing TOC.

- [ ] add support for `markdown_flavor="pandoc"`, see <http://pandoc.org/MANUAL.html#header-identifiers>

- [ ] add support for setext style headers if possible, see <http://pandoc.org/MANUAL.html#headers>

- [ ] scan `md` for R Markdown YAML header containing `toc: true` and print a warning about possibility of TOC duplication

- [x] performance: scan `md` only once for code block positions --> separate function

- [ ] make it impossible to insert TOC in between code blocks (otherwise it won't get removed anymore in subsequent runs of `add_toc()`; besides it wouldn't make sense anyway)

- [ ] better backlink removal: scan file for anchor links contained in multiple headers -> remove the most frequent one (if link text length == 1 or so)

- [ ] add yet another TOC listing mode: ordered with auto-numbering of headers (vgl. <https://raw.githubusercontent.com/xbmc/xbmc/be9a679876c603fab82a19c565d5a187ca1b5910/docs/GIT-FU.md>)

- [ ] add option to format TOC entries bold and/or italic down to TOC level # (default: 1st level)

- [ ] add option to set number of spaces for markdown indentation (maybe only a binary option à la `indent_by_4_spaces` to use four spaces instead of two)

- [ ] add options to set number of newlines above and below TOC comments

- [ ] make the package's functionality somehow available as a webservice!


## to add a TOC

- [broom](https://github.com/tidyverse/broom)
- [youtube-dl](https://github.com/rg3/youtube-dl/)


## to spread package

- <https://github.com/rstudio/blogdown/issues/267>


