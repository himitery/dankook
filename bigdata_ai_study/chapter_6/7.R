# 상관계수
corList <- cor(mtcars$mpg, mtcars[, - which(names(mtcars) == "mpg")])
print(corList)

# 상관성이 가장 높은 변수
var <- corList[, which.max(corList)]
print(var)

plot(mtcars$mpg, mtcars[, c(names(var))])
