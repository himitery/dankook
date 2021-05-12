for (i in 1:9) {
  col <- c()
  for (j in 2:9) {
    col <- c(col, i * j)
  }
  print(col)
}