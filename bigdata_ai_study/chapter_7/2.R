st <- data.frame(state.x77)

# (1)
boxplot(st)

# (2)
for (i in 1:ncol(st)) {
  out.val <- boxplot.stats(st[, i])$out
  st[, i][st[, i] %in% out.val] <- NA
}

# (3)
st2 <- st[complete.cases(st),]
