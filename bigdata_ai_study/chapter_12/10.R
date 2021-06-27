library(cvTools)
library(class)
library(mlbench)
data("Vowel")

folds <- cvFolds(nrow(Vowel), K = 10)

acc <- c()
for (i in 1:10) {
  test.index <- folds$which == i

  data.train <- Vowel[-test.index, - ncol(Vowel)]
  data.test <- Vowel[test.index, - ncol(Vowel)]

  class.train <- factor(Vowel[-test.index, ncol(Vowel)])
  class.test <- factor(Vowel[test.index, ncol(Vowel)])

  pred <- knn(data.train, data.test, class.train, k = 5)
  acc[i] <- mean(pred == class.test)
}


print(acc)
print(mean(acc))

