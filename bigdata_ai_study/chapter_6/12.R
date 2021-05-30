install.packages("mlbench")

# 1
library(mlbench)
data("Glass")
myds <- Glass

# 2
plot(myds[, - which(names(myds) == "Type")])

# 3
cor(myds[, - which(names(myds) == "Type")])

# 4
length(unique(myds[, which(names(myds) == "Type")]))

data <- myds[, - which(names(myds) == "Type")]
point <- as.numeric(myds$Type)
color <- c("red", "orange", "green", "blue", "pink", "purple")

pairs(
    data,
    pch = c(point),
    col = color[point]
)
