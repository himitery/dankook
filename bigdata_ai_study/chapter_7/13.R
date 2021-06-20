subset(state.x77, state.x77[, "Area"] > state.x77["Alabama", "Area"] & state.x77[, "Area"] < state.x77["California", "Area"])[, c("Population", "Income", "Area")]
