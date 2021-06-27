model <- lm(formula = pressure ~ temperature, data = pressure)

getPressure <- function(temperature) {
  return(coef(model)[2] * temperature + coef(model)[1])
}

# temperature == 65
getPressure(65)

# temperature == 95
getPressure(95)

# temperature == 155
getPressure(155)
