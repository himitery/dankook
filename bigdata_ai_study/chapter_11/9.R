library(mlbench)
data(Glass)

# (1)
set.seed(100)
random <- sample(1:nrow(Glass), size = (as.integer(nrow(Glass) * 0.6)), replace = FALSE)

train <- Glass[c(random),]
test <- Glass[-c(random),]

# (2)
train.new <- train
train.new$Type <- as.integer(train.new$Type)

model <- glm(formula = Type ~ ., data = train.new)

Type <- round(
    coef(model)[2] * train.new$RI +
    coef(model)[3] * train.new$Na +
    coef(model)[4] * train.new$Mg +
    coef(model)[5] * train.new$Al +
    coef(model)[6] * train.new$Si +
    coef(model)[7] * train.new$K +
    coef(model)[8] * train.new$Ca +
    coef(model)[9] * train.new$Ba +
    coef(model)[10] * train.new$Fe +
    coef(model)[1], 0
)

# (3)
test.new <- test
test.new$Type <- as.integer(test.new$Type)

pred <- round(predict(model, test.new), 0)
print(pred)

# (4)
acc <- mean(test.new$Type == pred)
print(acc)
