library(Rtsne)
library(rgl)
library(car)
library(ggplot2)
font_import(pattern = "D2")

theme_set(theme_grey(base_family = "D2Coding"))

data.dim.2 <- data.frame(Rtsne(swiss, dim = 2, perplexity = 10)$Y)
data.dim.3 <- data.frame(Rtsne(swiss, dim = 3, perplexity = 10)$Y)

ggplot(data.dim.2, aes(x = X1, y = X2)) +
    geom_point(size = 2)

scatter3d(x = data.dim.3$X1, y = data.dim.3$X2, z = data.dim.3$X3)

