# (1)
count <- 0
sum <- 0

for (i in 1:100) {
  count <- count + 1
  sum <- sum + i
}

print(c(count, sum))

# (2)
for (i in 101:200) {
  if (i %% 3 == 0 & i %% 4 == 0) {
    print(i)
  }
}

# (3)
for (i in 1:24) {
  if (24 %% i == 0) {
    print(i)
  }
}

# (4)
factorialResult <- 1
for (i in 1:10) {
  factorialResult <- factorialResult * i
}

print(factorialResult)