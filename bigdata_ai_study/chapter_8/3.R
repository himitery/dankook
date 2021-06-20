swiss.with_name = data.frame(swiss, names = rownames(swiss))

symbols(
    swiss.with_name$Fertility,
    swiss.with_name$Agriculture,
    circles = swiss.with_name$Education,
    bg = "green"
)
text(
    swiss.with_name$Fertility,
    swiss.with_name$Agriculture,
    swiss.with_name$names,
    cex = 0.6
)
