# (1)
mean(mtcars[, "wt"])
median(mtcars[, "wt"])
mean(mtcars[, "wt"], trim = 0.15)
sd(mtcars[, "wt"])

# (2)
summary(mtcars[, "wt"])

# (3)
table(mtcars[, "cyl"])

# (4)
barplot(mtcars[, "cyl"])

# (5)
hist(mtcars[, "wt"])

# (6)
boxplot(mtcars[, "wt"])
boxplot.stats(table(mtcars[, "wt"]))

# (7)
boxplot(mtcars[, "disp"])
boxplot.stats(mtcars[, "disp"])

# (8)
boxplot(mtcars$mpg ~ mtcars$gear)
