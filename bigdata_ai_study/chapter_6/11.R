length(unique((Orange[, "Tree"])))

data <- Orange[, c("age", "circumference")]
point <- as.numeric(Orange$Tree)
color <- c("red", "orange", "green", "blue", "pink")

plot(
    data,
    pch = c(point),
    col = color[point]
)
