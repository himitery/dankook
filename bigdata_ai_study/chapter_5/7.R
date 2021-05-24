# (1)
print(Orange[(1:10),])

# (2)
mean(Orange[, "age"])
median(Orange[, "age"])
mean(Orange[, "age"], trim = 0.15)
sd(Orange[, "age"])

# (3)
hist(Orange[, "age"])

# (4)
boxplot(Orange$age ~ Orange$Tree)

# (5) ?
mean(subset(Orange, Tree != 2)[, "circumference"])
median(subset(Orange, Tree != 2)[, "circumference"])
mean(subset(Orange, Tree != 2)[, "circumference"], trim = 0.15)
sd(subset(Orange, Tree != 2)[, "circumference"])

# (6) ?
hist(subset(Orange, Tree != 2)[, "circumference"])

# (7)
boxplot(Orange$circumference ~ Orange$Tree)
