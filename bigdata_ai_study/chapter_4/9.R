lgm <- function(x, y) {
  while (y) {
    temp <- x %% y
    x <- y
    y <- temp
  }
  return(x)
}

lgm(10, 8)
lgm(10, 20)