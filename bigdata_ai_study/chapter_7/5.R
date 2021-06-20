# (1)
mt.gear <- split(mtcars, mtcars$gear)

# (2)
mt.gear$'4'

# (3)
mt.gear.35 <- merge(mt.gear$'3', mt.gear$'5', all = T)

# (4)
subset(mtcars, mtcars[, 6] >= 1.5 & mtcars[, 6] <= 3.0)
