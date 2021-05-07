# (1)
setwd(getwd())
write.csv(subset(data.frame(state.x77), Income >= 5000)[, c("Income", "Population", "Area")], "rich_state.csv", row.names = F)

# (2)
ds <- read.csv("rich_state.csv", header = F)
print(ds)
