library(mlbench)
data(PimaIndiansDiabetes)

# (1)
set.seed(100)
random <- sample(1:nrow(PimaIndiansDiabetes), size = (as.integer(nrow(PimaIndiansDiabetes) * 0.6)), replace = FALSE)

train <- PimaIndiansDiabetes[c(random),]
test <- PimaIndiansDiabetes[-c(random),]

# (2)
train.new <- train
train.new$diabetes <- as.integer(train.new$diabetes)

model <- glm(formula = diabetes ~ ., data = train.new)

diabetes <- round(
    coef(model)[2] * train.new$pregnant +
    coef(model)[3] * train.new$glucose +
    coef(model)[4] * train.new$pressure +
    coef(model)[5] * train.new$triceps +
    coef(model)[6] * train.new$insulin +
    coef(model)[7] * train.new$mass +
    coef(model)[8] * train.new$pedigree +
    coef(model)[9] * train.new$age +
    coef(model)[1], 0
)

# (3)
test.new <- test
test.new$diabetes <- as.integer(test.new$diabetes)

pred <- round(predict(model, test.new), 0)
print(pred)

# (4)
acc <- mean(test.new$diabetes == pred)
print(acc)
