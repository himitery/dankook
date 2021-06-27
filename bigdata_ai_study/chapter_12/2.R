library(mlbench)
data("Sonar")

data <- Sonar[, - c(length(Sonar))]

fit <- kmeans(x = data, center = 2)