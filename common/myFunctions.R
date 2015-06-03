#  --------------------------------------------------------
#
#   Common preamble for my R functions
#
#   RAL
#   2015-03-11
#
#  --------------------------------------------------------

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

# clears labels from labelled data sets
# Use as follows:
# my.unlabelled.df <- clear.labels(my.labelled.df)
clear.labels <- function(x) {
  if(is.list(x)) {
    for(i in 1 : length(x)) class(x[[i]]) <- setdiff(class(x[[i]]), 'labelled') 
    for(i in 1 : length(x)) attr(x[[i]],"label") <- NULL
  }
  else {
    class(x) <- setdiff(class(x), "labelled")
    attr(x, "label") <- NULL
  }
  return(x)
}

# last line 
