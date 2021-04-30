d1 <- 1:50
d2 <- 51:100

# (1)
print(c(d1, d2))

# (2)
print(length(d2))

# (3)
print(c(d1 + d2, d2 - d1, d1 * d2, d2 / d1))

# (4)
print(c(sum(d1), sum(d2)))

# (5)
print(sum(c(d1, d2)))

# (6)
print(c(max(d2), min(d2)))
# (7)
print(c(mean(d2), mean(d1), mean(d2) - mean(d1)))

# (8)
print(sort(d1, TRUE))

# (9)
d3 <- c(sort(d1, FALSE)[1:10], sort(d2, FALSE)[1:10])
print(d3)
