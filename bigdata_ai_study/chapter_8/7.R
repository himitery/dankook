install.packages("ggplot2")
library(ggplot2)
library(extrafont)
font_import(pattern = "D2")

theme_set(theme_grey(base_family = "D2Coding"))

ggplot(mtcars, aes(gear)) +
    geom_bar(
        width = 0.7,
    ) +
    labs(x = "기어의 수", y = "빈도수")

