library(extrafont)
font_import(pattern = "D2")

years <- 1875:1972
hlevel <- as.vector(LakeHuron)

plot(
    years,
    hlevel,
    type = "l",
    main = "LakeHuron",
    ylab = "수위",
    col = "blue",
    family = "D2Coding"
)
