library(ggplot2)
library(extrafont)
font_import(pattern = "D2")

theme_set(theme_grey(base_family = "D2Coding"))

data <- data.frame(
    year = c(20144, 20151, 20152, 20153, 20154, 20161, 20162, 20163, 20164, 20171, 20172, 20173),
    male = c(73.9, 73.1, 74.4, 74.2, 73.5, 73, 74.2, 74.5, 73.8, 73.1, 74.5, 74.2),
    female = c(51.4, 50.5, 52.4, 52.4, 51.9, 50.9, 52.6, 52.7, 52.2, 51.5, 53.2, 53.1)
)

ggplot(data, aes(x = year)) +
    geom_line(aes(y = male), color = "blue") +
    geom_line(aes(y = female), color = "red")