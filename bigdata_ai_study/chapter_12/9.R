library(cvTools)
library(class)
library(mlbench)
data("Vehicle")

folds <- cvFolds(nrow(Vehicle), K = 10)

acc <- c()
for (i in 1:10) {
  test.index <- folds$which == i

  data.train <- Vehicle[-test.index, - ncol(Vehicle)]
  data.test <- Vehicle[test.index, - ncol(Vehicle)]

  class.train <- factor(Vehicle[-test.index, ncol(Vehicle)])
  class.test <- factor(Vehicle[test.index, ncol(Vehicle)])

  pred <- knn(data.train, data.test, class.train, k = 3)
  acc[i] <- mean(pred == class.test)
}


print(acc)
print(mean(acc))

