library(class)
library(mlbench)
data("Sonar")

data.train <- Sonar[1:nrow(Sonar) %% 2 == 1, - ncol(Sonar)]
data.test <- Sonar[1:nrow(Sonar) %% 2 == 0, - ncol(Sonar)]

class.train <- factor(Sonar[1:nrow(Sonar) %% 2 == 1, ncol(Sonar)])
class.test <- factor(Sonar[1:nrow(Sonar) %% 2 == 0, ncol(Sonar)])

# k == 3
pred <- knn(data.train, data.test, class.train, k = 3, prob = TRUE)
acc <- mean(pred == class.test)
print(acc)

# k == 5
pred <- knn(data.train, data.test, class.train, k = 5, prob = TRUE)
acc <- mean(pred == class.test)
print(acc)

# k ==7
pred <- knn(data.train, data.test, class.train, k = 7, prob = TRUE)
acc <- mean(pred == class.test)
print(acc)