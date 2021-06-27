# (1)
model <- lm(formula = Volume ~ Girth + Height, data = trees)

# (2)
G <- coef(model)[2]
H <- coef(model)[3]
I <- coef(model)[1]

Girth <- trees[, "Girth"]
Height <- trees[, "Height"]

pred <- G * Girth + H * Height + I

# (3)
df <- data.frame(pred, trees[, "Volume"], pred - trees[, "Volume"])
names(df) <- c("예측값", "실제값", "에측값-실제값")

print(df)

