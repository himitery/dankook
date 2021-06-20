set.seed(100)

randomSets <- sample(1:nrow(state.x77), size = 20, replace = FALSE)

st20 <- state.x77[randomSets,]
st.other <- state.x77[-randomSets,]
