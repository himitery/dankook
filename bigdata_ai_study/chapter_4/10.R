maxmin <- function(vector) {
  max <- max(vector)
  min <- min(vector)

  return(list(max = max, min = min))
}

v1 <- c(7, 1, 2, 8, 9)
result <- maxmin(v1)
result$max
result$min

result <- maxmin(iris[, 1])
result$max
result$min
