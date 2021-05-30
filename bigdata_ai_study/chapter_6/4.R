data <- iris[, c("Sepal.Length", "Sepal.Width")]
point <- as.numeric(iris$Species)
color <- c("red", "green", "blue")

plot(
    data,
    pch = c(point),
    col = color[point]
)
