# (1)
class(airquality)

# (2)
head(airquality)

# (3)
print(subset(airquality, Temp == max(airquality[, "Temp"]))[, c("Month", "Day")])

# (4)
print(max(subset(airquality, Month == 6)[, "Wind"]))

# (5)
print(mean(subset(airquality, Month == 7)[, "Temp"]))

# (6)
print(mean(subset(airquality, Month == 5 & Ozone)[, "Ozone"]))

# (7)
print(length(subset(airquality, Ozone > 100)))
