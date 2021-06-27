library(MASS)
library(mlbench)
data(BostonHousing)

# (1)
model.1 <- lm(formula = medv ~ ., data = BostonHousing)

mdev.1 <- coef(model.1)[2] * BostonHousing$crim +
        coef(model.1)[3] * BostonHousing$zn +
        coef(model.1)[4] * BostonHousing$indus +
        coef(model.1)[5] * BostonHousing$nox +
        coef(model.1)[6] * BostonHousing$rm +
        coef(model.1)[7] * BostonHousing$age +
        coef(model.1)[8] * BostonHousing$dis +
        coef(model.1)[9] * BostonHousing$rad +
        coef(model.1)[10] * BostonHousing$tax +
        coef(model.1)[11] * BostonHousing$ptratio +
        coef(model.1)[12] * BostonHousing$b +
        coef(model.1)[13] * BostonHousing$lstat +
        coef(model.1)[1]

# (2)
model.2 <- stepAIC(model.1)

mdev.2 <- coef(model.2)[2] * BostonHousing$crim +
        coef(model.2)[3] * BostonHousing$zn +
        coef(model.2)[4] * BostonHousing$nox +
        coef(model.2)[5] * BostonHousing$rm +
        coef(model.2)[6] * BostonHousing$dis +
        coef(model.2)[7] * BostonHousing$rad +
        coef(model.2)[8] * BostonHousing$tax +
        coef(model.2)[9] * BostonHousing$ptratio +
        coef(model.2)[10] * BostonHousing$b +
        coef(model.2)[11] * BostonHousing$lstat +
        coef(model.2)[1]

# (3)
summary(model.1) # 0.7338 
summary(model.2) # 0.7348

