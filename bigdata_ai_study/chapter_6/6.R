# 산점도
grade <- c(77.5, 60, 50, 95, 55, 85, 72.5, 80, 92.5, 87.5)
tvViewingTime <- c(14, 10, 20, 7, 25, 9, 15, 13, 4, 21)

data <- data.frame(grade, tvViewingTime)
names(data) <- c("성적", "TV 시청기간")

plot(data$grade ~ data$tvViewingTime)

# 상관계수
cor(grade, tvViewingTime)
