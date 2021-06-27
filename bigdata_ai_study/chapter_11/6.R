library(MASS)

# (1)
model.1 <- lm(formula = mpg ~ ., data = mtcars)

mpg.1 <- coef(model.1)[2] * mtcars$cyl +
        coef(model.1)[3] * mtcars$disp +
        coef(model.1)[4] * mtcars$hp +
        coef(model.1)[5] * mtcars$drat +
        coef(model.1)[6] * mtcars$wt +
        coef(model.1)[7] * mtcars$qsec +
        coef(model.1)[8] * mtcars$vs +
        coef(model.1)[9] * mtcars$am +
        coef(model.1)[10] * mtcars$gear +
        coef(model.1)[11] * mtcars$carb +
        coef(model.1)[1]

# (2)
model.2 <- stepAIC(model.1)

mpg.2 <- coef(model.2)[2] * mtcars$wt +
        coef(model.2)[3] * mtcars$qsec +
        coef(model.2)[4] * mtcars$am +
        coef(model.2)[1]

# (3)
summary(model.1) # 0.8066
summary(model.2) # 0.8336

