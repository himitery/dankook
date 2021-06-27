state.x77.df = data.frame(state.x77)

model <- lm(formula = Murder ~ Illiteracy, data = state.x77.df)

getMurder <- function(Illiteracy) {
  return(coef(model)[2] * Illiteracy + coef(model)[1])
}

# Illiteracy == 0.5
getMurder(0.5)

# Illiteracy == 1.0
getMurder(1.0)

# Illiteracy == 1.5
getMurder(1.5)
