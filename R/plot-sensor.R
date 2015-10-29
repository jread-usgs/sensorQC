#' @export
plot.sensor <- function(x, y=NULL, ...){
  args = expand.grid(...)
  # check that ylab and xlab aren't in ...
  
  x <- clean(x, which='all',replace=NULL)

  if (nrow(args) && names(args) %in% c('ylab','xlab'))
    plot(x$sensor$times, x$sensor$x, ...)
  else
    plot(x$sensor$times, x$sensor$x, ylab='sensor', xlab='DateTime', ...)
}

#' @export
points.sensor <- function(x, y=NULL, ...){
  
  args = expand.grid(...)
  # check that ylab and xlab aren't in ...
  
  x <- clean(x, which='all',replace=NULL)
  
  
  if (nrow(args) && names(args) %in% c('ylab','xlab'))
    points(x$sensor$times, x$sensor$x, ...)
  else
    points(x$sensor$times, x$sensor$x, ylab='sensor', xlab='DateTime', ...)
}