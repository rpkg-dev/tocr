# define functions
purl = Rscript -e "knitr::purl(input = '$(1)', \
                               output = '$(2)', \
                               quiet = TRUE, \
                               documentation = 0)"
knit2md = Rscript -e "knitr::knit2pandoc(input = '$(1)', \
                                         output = '$(2)', \
                                         tangle = FALSE, \
                                         encoding = 'UTF-8', \
                                         to = 'markdown_github')"

# generate all target R filenames
rfiles:=$(patsubst vignettes/LP-%.Rmd,R/%-GEN.R,$(wildcard vignettes/LP-*.Rmd))

# define target files to be built in standard make target
all: $(rfiles) README.md

# build literate programming .Rmd source files
R/%-GEN.R: vignettes/LP-%.Rmd
	$(call purl,$^,$@)

# build README.md
README.md: README.Rmd ../snippets/R\ Markdown/installation_notice_dev_version.Rmd ../snippets/R\ Markdown/literate_programming_notice.Rmd"
	$(call knit2md,README.md,README.md)
	if test -f README.markdown_github; then rm README.markdown_github; fi

# dummy recipes for unbuilt dependencies
../snippets/R\ Markdown/installation_notice_dev_version.Rmd:

../snippets/R\ Markdown/literate_programming_notice.Rmd":

