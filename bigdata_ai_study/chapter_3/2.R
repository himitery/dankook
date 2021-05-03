# (1)
st <- data.frame(state.x77)

# (2)
print(st)

# (3)
print(colnames(st))

# (4)
print(rownames(st))

# (5)
dim(st)

# (6)
str(st)

# (7)
print(c(rowSums(st), rowMeans(st)))

# (8)
print(c(colSums(st), colMeans(st)))

# (9)
print(st["Florida",])

# (10)
print(st[, "Income"])

# (11)
print(st["Texas", "Area"])

# (12)
print(st["Ohio", c("Population", "Income")])

# (13)
print(subset(st, "Population" >= 5000))

# (14)
print(subset(st, Income >= 4500)[, c("Population", "Income", "Area")])

# (15)
print(length(subset(st, Income >= 4500)))

# (16)
print(subset(st, Area >= 100000 & Frost >= 120))

# (17)
print(subset(st, Population < 2000 & Murder < 12))

# (18)
print(mean(subset(st, Illiteracy >= 2.0)[, "Income"]))

# (19)
print(
    mean(subset(st, Illiteracy < 2.0)[, "Income"])
    - mean(subset(st, Illiteracy >= 2.0)[, "Income"])
)

# (20)
print(subset(st, Life.Exp == max(st[, "Life.Exp"])))

# (21)
print(subset(st, Income > st["Pennsylvania", "Income"]))

