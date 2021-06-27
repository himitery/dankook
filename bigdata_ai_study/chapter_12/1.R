std <- function(X) {
  return((X - min(X)) / (max(X) - min(X)))
}

data <- apply(data.frame(state.x77), 2, std)

fit <- kmeans(x = data, center = 5)