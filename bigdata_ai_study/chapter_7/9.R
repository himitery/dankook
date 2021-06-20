set.seed(100)

randomSets <- sample(1:nrow(iris), size = 10, replace = FALSE)

iris.10 <- iris[randomSets,]
print(iris.10)
