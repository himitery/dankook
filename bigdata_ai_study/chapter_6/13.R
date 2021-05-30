# 1
library(mlbench)
data("Ionosphere")
myds <- Ionosphere[, 3:12]

# 2
corList <- data.frame(cor(myds))
corList <- 1 - abs(corList)
corList[corList == 0] <- 10
index <- which(corList == min(corList))[1]

x <- names(myds)[(index - index %% 10) / 10 + 1]
y <- names(myds)[index %% 10]

plot(myds[c(x, y)])

cor(myds[x], myds[y])
