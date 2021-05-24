# (1)
print(trees[(1:10),])

# (2)
mean(trees[, "Girth"])
median(trees[, "Girth"])
mean(trees[, "Girth"], trim = 0.15)
sd(trees[, "Girth"])

# (3)
hist(trees[, "Girth"])

# (4)
boxplot(trees[, "Girth"])

# (5)
mean(trees[, "Height"])
median(trees[, "Height"])
mean(trees[, "Height"], trim = 0.15)
sd(trees[, "Height"])

# (6)
hist(trees[, "Height"])

# (7)
boxplot(trees[, "Height"])