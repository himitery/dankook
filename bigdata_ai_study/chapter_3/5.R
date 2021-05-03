# (1)
str(swiss)

# (2)
print(subset(swiss, Agriculture == max(swiss[, "Agriculture"])))

# (3)
print(cbind(rownames(swiss), sort(swiss[, "Agriculture"], TRUE)))

# (4)
print(subset(swiss, Catholic >= 80.0)[, "Agriculture"])

# (5)
print(subset(swiss, Examination < 20 & Agriculture < 50)[, c("Examination", "Agriculture")])
