trees.with_name = data.frame(trees, names = rownames(trees))

symbols(
    trees.with_name$Girth,
    trees.with_name$Height,
    circles = trees.with_name$Volume,
    bg = "blue"
)
text(
    trees.with_name$Girth,
    trees.with_name$Height,
    trees.with_name$names,
    cex = 0.6
)

