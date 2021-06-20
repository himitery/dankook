library(ggplot2)
library(extrafont)
font_import(pattern = "D2")

theme_set(theme_grey(base_family = "D2Coding"))

data <- data.frame(
    year = c(2015:2026),
    population = c(51014, 51245, 51446, 51635, 51811, 51973, 52123, 52261, 52388, 52504, 52609, 52704)
)

ggplot(data, aes(x = year, y = population)) +
    geom_line() +
    labs(x = "연도", y = "총 인구(단위: 쳔 명)")
