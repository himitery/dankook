install.packages("treemap")
library(treemap)

us <- data.frame(state.x77, state.division)

# (1)
us.with_name <- data.frame(us, names = rownames(us))
treemap(
    us.with_name,
    index = c("state.division", "names"),
    vSize = "Population",
    vColor = "Income",
    type = "index"
)

# (2)
treemap(
    us.with_name,
    index = c("state.division", "names"),
    vSize = "HS.Grad",
    vColor = "Murder",
    type = "index"
)

# (3)
symbols(
    us.with_name$Income,
    us.with_name$Illiteracy,
    circles = us.with_name$Population,
    bg = "green"
)
text(
    us.with_name$Income,
    us.with_name$Illiteracy,
    us.with_name$names,
    cex = 0.6
)

# (4)
symbols(
    us.with_name$Illiteracy,
    us.with_name$Murder,
    circles = us.with_name$Area,
    bg = "green"
)
text(
    us.with_name$Illiteracy,
    us.with_name$Murder,
    us.with_name$names,
    cex = 0.6
)
