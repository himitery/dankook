# (1)
class(mtcars)

# (2)
dim(mtcars)

# (3)
str(mtcars)

# (4)
# pass

# (5)
print(subset(mtcars, mpg == max(mtcars[, "mpg"])))

# (6)
print(subset(mtcars, mpg == min(subset(mtcars, gear == 4)[, "mpg"])))

# (7)
print(mtcars["Honda Civic", c("mpg", "gear")])

# (8)
print(subset(mtcars, mpg > mtcars["Pontiac Firebird", "mpg"]))

# (9)
print(mean(mtcars[, "mpg"]))

# (10)
print(unique(mtcars[, "gear"]))
