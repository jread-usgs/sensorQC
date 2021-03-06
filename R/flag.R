
#'@title Creates flag vector based on input data
#'@description 
#'Creates flag vector with codes and methods according to params list.  \cr
#'
#'
#'@param x data
#'@param flag.defs definitions for flagging
#'@param \dots additional defs for flags
#'@return a vector of flags of length equal to number of rows in data.in
#'@keywords methods
#'@author
#'Jordan S. Read
#'@examples 
#'dates <- seq(as.POSIXct('1999-01-01'),by=1,length.out=14)
#'values <- c(runif(12,2,4),NA,NA)
#'data.in <- data.frame("DateTime"=dates,"sensor.obs"=values)
#'simple.sqc <- list(list(expression="x == 999999",type="error_code",description="logger error code"),
#'              list(expression='is.na(x)',type='error_code',description='missing data'))
#'
#'flag(data.in, "x == 999999")
#'flag(data.in,simple.sqc)
#'@export
flag <- function(x, flag.defs, ...){
  UseMethod('flag')
}


#' @export
flag.data.frame = function(x, flag.defs, ...){
  x = sensor(x)
  UseMethod('flag', x)
}
#' @export
flag.numeric = function(x, flag.defs, ...){
  x = data.frame(times = rep(NA,length(x)), x = x)
  flag(x, flag.defs, ...)
}

#' @export
flag.sensor <- function(x, flag.defs, ...){
  
  sensor = sensor(x, flag.defs, ...)
  flags = flags(sensor)
  for (i in seq_len(length(flags))){
    sensor[[2]][[i]]$flag.i = calc_flags(sensor,expr=flags[[i]]$expression)
  }

  return(sensor)
  
}
