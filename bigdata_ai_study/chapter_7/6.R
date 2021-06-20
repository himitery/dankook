# (1)
library(mlbench)
data("Glass")
myds <- Glass

# (2)
colMeans(myds[1:5])
