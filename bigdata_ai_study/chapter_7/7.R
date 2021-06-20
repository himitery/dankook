# (1)
library(mlbench)
data("Ionosphere")
myds <- Ionosphere

# (2)
for (i in 3:10) {
  cat(colnames(myds)[i], "\t", mean(myds[order(myds[, 1]),][, i]), "\n")
}
