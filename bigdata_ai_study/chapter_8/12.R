library(ggplot2)
library(extrafont)
font_import(pattern = "D2")

theme_set(theme_grey(base_family = "D2Coding"))

ggplot(mtcars, aes(y = mpg, fill = as.factor(cyl))) +
   geom_boxplot()