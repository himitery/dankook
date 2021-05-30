library(extrafont)
font_import(pattern = "D2")

year <- c(2015:2026)
population <- c(51014, 51245, 51446, 51635, 51811, 51973, 52123, 52261, 52388, 52504, 52609, 52704)

plot(
    year,
    population,
    type = "l",
    xlab = "연도",
    ylab = "총인구 (천명)",
    family = "D2Coding"
)
