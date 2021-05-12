weight <- c(69, 50, 55, 71, 89, 64, 59, 70, 71, 80)

# (1)
which.max(weight)

# (2)
which.min(weight)

# (3)
which(weight >= 61 & weight <= 69)

# (4)
weight.2 <- which(weight <= 60)
weight[weight.2]