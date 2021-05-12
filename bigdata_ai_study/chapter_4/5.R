primeNumber <- c()
ignoreValue <- c()

for (i in 2:1000) {
  if (!(i %in% ignoreValue)) {
    if (i == 2) {
      primeNumber <- c(primeNumber, i)
    } else {
      for (j in 2:round(i / 2)) {
        if (i %% j == 0) {
          return
        } else if (j == round(i / 2)) {
          primeNumber <- c(primeNumber, i)
        }
      }
    }
    ignoreValue <- unique(c(ignoreValue, c(i:1000)[c(i:1000) %% i == 0]))
  }
}

print(primeNumber)

