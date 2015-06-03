#  --------------------------------------------------------
#
#   Common preamble  for Rmd files
#   setup knitr, pandoc, and table/figure auto-number functions
#
#   RAL
#   2015-03-11
#
#  --------------------------------------------------------

# these first 3 lines must be in initial Rmd code chunk
library(knitr) 
# opts_knit$set(root.dir = "../")
# opts_chunk$set(include=TRUE, echo=FALSE, eval=TRUE)



# package options
opts_knit$set(aliases = c(h = "fig.height", w = "fig.width"))
opts_chunk$set(h = 3.1, w = 4.5)

# chunk options
opts_chunk$set(fig.path = "../figures/", fig.keep = "last")
opts_chunk$set(dev = "tiff", dpi = 600)
opts_chunk$set(warning=FALSE, message=FALSE)

# pander settings for knitting/rendering tables in docx
library(pander)
panderOptions('table.alignment.default'
              , function(df) ifelse(sapply(df, is.numeric), 'right', 'left'))
panderOptions('table.split.table', Inf)
panderOptions('big.mark', ",")
panderOptions('keep.trailing.zeros', TRUE)




# function to generate Incremental Figure Numbers
FigureNumber = local({
    i = 0
    function(x) {
        i <<- i + 1
        paste('Figure ', i, '. ', x, sep = '')
    }
})

# Incremental Table Numbers
TableNumber = local({
    i = 0
    function(x) {
        i <<- i + 1
        paste('Table ', i, '. ', x, sep = '')
    }
})

# function to set my own scale limits consistently
myXYLimits <- function (xAt) {
  xGap = 0.03 * (max(xAt) - min(xAt))
  xLimits = c(min(xAt) - xGap, max(xAt) + xGap)
}

# last line 
