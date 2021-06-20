library(ggplot2)
library(extrafont)
font_import(pattern = "D2")

theme_set(theme_grey(base_family = "D2Coding"))

ggplot(mtcars, aes(cyl)) +
    geom_bar(
        width = 0.7,
        fill = "green"
    )
