# (1)
score <- matrix(c(10, 40, 60, 20, 21, 60, 70, 30), nrow = 4, ncol = 2)
colnames(score) <- c("m", "f")

# (2)
colnames(score) <- c("male", "femail")

# (3)
print(score[2,])

# (4)
print(score[, "femail"])

# (5)
print(score[3, 2])
