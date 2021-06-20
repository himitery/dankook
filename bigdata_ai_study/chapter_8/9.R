library(ggplot2)
library(extrafont)
font_import(pattern = "D2")

theme_set(theme_grey(base_family = "D2Coding"))

ggplot(mtcars, aes(mpg)) +
    geom_histogram(binwidth = 5.0)