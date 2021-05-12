fibo <- c(0:1)

while (length(fibo) < 40) {
  fibo <- c(fibo, (fibo[length(fibo) - 1] + fibo[length(fibo)]))
}

print(fibo)