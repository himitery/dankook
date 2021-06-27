library(cvTools)
library(class)
library(mlbench)
data("BreastCancer")

data <- BreastCancer
for (i in 1:ncol(data)) {
  data <- data[!is.na(data[, i]),]
}

folds <- cvFolds(nrow(data), K = 10)

acc <- c()
for (i in 1:10) {
  test.index <- folds$which == i

  data.train <- data[-test.index, - ncol(data)]
  data.test <- data[test.index, - ncol(data)]

  class.train <- factor(data[-test.index, ncol(data)])
  class.test <- factor(data[test.index, ncol(data)])

  pred <- knn(data.train, data.test, class.train, k = 5)
  acc[i] <- mean(pred == class.test)
}


print(acc)
print(mean(acc))

