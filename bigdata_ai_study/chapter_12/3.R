library(cluster)

fit <- kmeans(x = swiss, center = 3)

clusplot(swiss, fit$cluster, color = TRUE, shade = TRUE, labels = 1, lines = 0)