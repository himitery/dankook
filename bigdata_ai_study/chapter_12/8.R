library(cvTools)
library(class)
library(mlbench)
data("PimaIndiansDiabetes")

folds <- cvFolds(nrow(PimaIndiansDiabetes), K = 10)

acc <- c()
for (i in 1:10) {
  test.index <- folds$which == i

  data.train <- PimaIndiansDiabetes[-test.index, - ncol(PimaIndiansDiabetes)]
  data.test <- PimaIndiansDiabetes[test.index, - ncol(PimaIndiansDiabetes)]

  class.train <- factor(PimaIndiansDiabetes[-test.index, ncol(PimaIndiansDiabetes)])
  class.test <- factor(PimaIndiansDiabetes[test.index, ncol(PimaIndiansDiabetes)])

  pred <- knn(data.train, data.test, class.train, k = 5)
  acc[i] <- mean(pred == class.test)
}


print(acc)
print(mean(acc))

