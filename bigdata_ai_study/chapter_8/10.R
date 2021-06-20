library(ggplot2)
library(extrafont)
font_import(pattern = "D2")

theme_set(theme_grey(base_family = "D2Coding"))

ggplot(trees, aes(Girth)) +
    geom_histogram(binwidth = 5.0, fill = "steelblue") +
    ggtitle("나무 둘레에 따른 빈도수") +
    labs(x = "나무 둘레", y = "빈도수")