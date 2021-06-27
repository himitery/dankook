mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")

# (1)
mydata.new <- mydata
mydata.new$admit <- as.integer(mydata.new$admit)

model <- glm(formula = admit ~ gre + gpa + rank, data = mydata)

# (2)
admit <- round(
    coef(model)[2] * mydata$gre +
    coef(model)[3] * mydata$gpa +
    coef(model)[4] * mydata$rank +
    coef(model)[1], 0
)

print(mydata.new$admit)
print(admit)

# (3)
acc <- mean(mydata.new$admit == admit)
print(acc)

