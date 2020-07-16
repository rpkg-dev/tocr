# TODO

## stuff to finish

- [x] rename package to `tocr`
    - minor issue: there's another R package named [tocR](https://github.com/sambold/tocR/) to crawl TOR sites (not on CRAN) -> ideally its author would rename it to `torc`!

- [ ] `add_toc()`: remove param `add_title` and use `title = NULL` to disable the title

- [ ] remove Markdown footnotes from TOC entries; example: <https://gitlab.com/c2d-zda/i_voting_dataset/blob/master/ANALYSIS.md>

- [ ] finish intro-Vignette

- [ ] `add_toc()`: add proper @description and @details (i.a. link to intro-Vignette)

- [ ] set up testthat tests!
    - [ ] separate md documents for every feature without and with TOC --> running them through `add_toc()` needs to produce identical results!
    - [ ] huge mega md document (or several of them) without and with TOC --> running it through `add_toc()` needs to produce an identical result!
    - [ ] `handle_existing_toc()` --> TOC comment detection
        - see `/home/salim/Schreibtisch/Markdown TOC - comment format.jpg`

## Bugs

- [ ] umlauts aren't lowercased as requied (at least not when `format = "gitlab"`)

- [ ] fix handling of trailing `#` in header processing (adhere to <try.commonmark.org>)

- [ ] duplicated h1 header (strange in general) if `position` > 7 and < 27:

    ```
    readLines(con = "https://raw.githubusercontent.com/thlorenz/doctoc/1d386261972d35c6bcd187d0a00e666f9d893d8d/README.md") %>%
      add_toc(position = 15) %>%
        cat(sep = "\n")
    ```

## Features

- [ ] add `add_anchor_symbols` option (default: `FALSE`) adding the HTML anchor link _after_ the header text as a clickable `🔗` (U+1F517) symbol. By default, use Markdown links, but maybe add option to color (light grey by default) the symbols? add the same for the backlinks?

- [ ] add `position = "existing"` and make it the default (with fallback to `"above"` if no TOC exists). This should just place the TOC at the exact same position as an already existing TOC.

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

- [ ] add option to make TOC foldable by enclosing it in HTML `<details>` and [`<summary>`](https://www.w3schools.com/tags/tag_summary.asp) tags. 

- [ ] add option `collapsible` to wrap the TOC in a [`<details>` tag](https://www.w3schools.com/TAGS/tag_details.asp) and the title in a [`<summary>` tag](https://www.w3schools.com/tags/tag_summary.asp). Example of such a TOC: <https://github.com/netlify/addons/blob/6e888b3b80a6960de56d61596cb75986bb8955d3/README.md>
  
  `collapsible` should support the following values:
    - `NULL` (no `<details>` tag)
    - `opened` (default open)
    - `closed` (default collapsed)
  
  Open question: Do the backlinks still work with this? Only when `opened`?

- [ ] make the package's functionality available as a webservice.

    - ideally completely [serverless](https://en.wikipedia.org/wiki/Serverless_computing)!

    notable tech:
    
    - [plumber](https://github.com/rstudio/plumber), an r package to define RESTful web API endpoints using special comments. see the book [Creating APIs in R with Plumber](https://www.rplumber.io/docs/) for details.
    - [OpenFaaS](https://github.com/openfaas/faas), an anti-lock-in tool to manage event-driven functions and microservices using Kubernetes. see the blog post [Serverless R functions with OpenFaas](https://medium.com/@beanies/serverless-r-functions-with-openfaas-1cd34905834d) for an introduction.
    
    possible serverless hosting:
    
    - [Google Cloud Run](https://cloud.run/), Google's serverless hosting offer for FaaS. see
        - the blog post [Serverless R functions with Cloud Run](https://ericjinks.com/blog/2019/serverless-R-cloud-run/)
        - or googleCloudRunner's [_Cloud Run_ vignette](https://code.markedmondson.me/googleCloudRunner/articles/cloudrun.html)
    
    more good reads:
    
    - [R on Kubernetes - serverless Shiny, R APIs and scheduled scripts](https://code.markedmondson.me/r-on-kubernetes-serverless-shiny-r-apis-and-scheduled-scripts/)
    - [Introducing googleCloudRunner - serverless R on Google Cloud Platform](https://code.markedmondson.me/googleCloudRunner-intro/)


## to add a TOC

- [broom](https://github.com/tidyverse/broom)
- [drake](https://github.com/ropensci/drake/blob/master/README.md)
- [youtube-dl](https://github.com/rg3/youtube-dl/)


## to spread package

- <https://github.com/rstudio/blogdown/issues/267>
