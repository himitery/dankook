library(extrafont)
font_import(pattern = "D2")

year <- c(20144, 20151:20154, 20161:20164, 20171:20173)
male <- c(73.9, 73.1, 74.4, 74.2, 73.5, 73, 74.2, 74.5, 73.8, 73.1, 74.5, 74.2)
female <- c(51.4, 50.5, 52.4, 52.4, 51.9, 50.9, 52.6, 52.7, 52.2, 51.5, 53.2, 53.1)

plot(
    year,
    male,
    type = "o",
    col = "blue",
    ylim = c(40, 80),
    axes = F,
)

lines(
    year,
    female,
    type = "o",
    col = "red",
)

xLabel = c("2014년도 1분기", "2015년도 1분기", "2015년도 2분기", "2015년도 3분기", "2015년도 4분기", "2016년도 1분기", "2016년도 2분기", "2016년도 3분기", "2016년도 4분기", "2017년도 1분기", "2017년도 2분기", "2017년도 3분기")

axis(side = 1, at = year, label = xLabel, family = "D2Coding")
axis(side = 2, at = seq(40, 80, by = 5))
