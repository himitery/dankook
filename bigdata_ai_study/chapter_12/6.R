library(cvTools)
library(class)
library(mlbench)
data("Sonar")

folds <- cvFolds(nrow(Sonar), K = 5)

acc <- c()
for (i in 1:5) {
  test.index <- folds$which == i

  data.train <- Sonar[-test.index, - ncol(Sonar)]
  data.test <- Sonar[test.index, - ncol(Sonar)]

  class.train <- factor(Sonar[-test.index, ncol(Sonar)])
  class.test <- factor(Sonar[test.index, ncol(Sonar)])

  pred <- knn(data.train, data.test, class.train, k = 3)
  acc[i] <- mean(pred == class.test)
}

print(acc)
print(mean(acc))