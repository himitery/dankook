# (1)
AQ <- airquality

# (2)
for (i in 1:ncol(AQ)) {
  cat(colnames(AQ)[i], "    ", "\t", sum(is.na(AQ[, i])), "\n")
}

# (3)
for (i in 1:nrow(AQ)) {
  cat(rownames(AQ)[i], "\t", sum(is.na(AQ[i,])), "\n")
}

# (4)
AQ[complete.cases(AQ),]

# (5)
AQ2 <- AQ
for (i in 1:ncol(AQ2)) {
  AQ2[, i][AQ2[, i] %in% NA] <- colMeans(AQ2, na.rm = TRUE)[i]
}
print(AQ2)
