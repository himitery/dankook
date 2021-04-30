d <- c(100:200)

# (1)
print(d)

# (2)
print(d[10])

# (3)
print(d[-1:-90])

# (4)
print(d[d %% 2 == 1])

# (5)
print(d[d %% 3 == 0])

# (6)
d.20 <- d[1:20]
print(d.20)

# (7)
print(d.20[-5])

# (8)
print(d.20[-seq(5, 9, 2)])
