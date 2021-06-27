library(cluster)

fit <- kmeans(x = rock, center = 3)

clusplot(rock, fit$cluster, color = TRUE, shade = TRUE, labels = 1, lines = 0)