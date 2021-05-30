# 산점도
income <- c(121, 99, 41, 35, 40, 29, 35, 24, 50, 60)
educationPeriod <- c(19, 20, 16, 16, 18, 12, 14, 12, 16, 17)

data <- data.frame(income, educationPeriod)
names(data) <- c("수입, 교육기간")

plot(data)

# 상관계수
cor(income, educationPeriod)
