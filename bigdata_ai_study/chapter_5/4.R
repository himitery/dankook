library(extrafont)
font_import(pattern = "D2")

# (1)
score <- c(90, 85, 73, 80, 85, 65, 78, 50, 68, 96)
names(score) <- c("KOR", "ENG", "ATH", "HIST", "SOC", "MUSIC", "BIO", "EARTH", "PHY", "ART")

# (2)
print(score)

# (3)
mean(score)
median(score)

# (4)
sd(score)

# (5)
names(subset(score, score == max(score)))

# (6)
boxplot(score)
boxplot.stats(score)$out

# (7)
hist(score, main = "학생 성적", col = "purple", family = "D2Coding")
