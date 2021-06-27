model <- lm(formula = Volume ~ Girth, data = trees)

getVolume <- function(Girth) {
  return(coef(model)[2] * Girth + coef(model)[1])
}

# Girth == 8.5
getVolume(8.5)

# Girth == 9.0
getVolume(9.0)

# Girth == 9.5
getVolume(9.5)
