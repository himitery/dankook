library(treemap)

# (1)
swiss.with_name <- data.frame(swiss, names = rownames(swiss))
for (i in 1:nrow(swiss.with_name)) {
  if (swiss.with_name[i, "Education"] <= 6)
    swiss.with_name[i, "Education"] <- "LOW"
  else if (swiss.with_name[i, "Education"] >= 13)
    swiss.with_name[i, "Education"] <- "HIGH"
  else
    swiss.with_name[i, "Education"] <- "MID"
}

treemap(
    swiss.with_name,
    index = c("Education", "names"),
    vSize = "Fertility",
    vColor = "Agriculture",
)

# (2)
swiss.with_name <- data.frame(swiss, names = rownames(swiss))

treemap(
    swiss.with_name,
    index = c("names"),
    vSize = "Catholic",
    vColor = "Examination"
)
