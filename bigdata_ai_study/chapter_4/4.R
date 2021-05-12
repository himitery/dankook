arr <- c()
for (i in 1:100) {
  if (i %% 3 == 0) {
    arr <- c(arr, '*')
  } else {
    arr <- c(arr, i)
  }
}

print(arr)