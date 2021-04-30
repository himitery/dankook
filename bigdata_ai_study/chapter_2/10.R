absent <- c(10, 8, 14, 15, 9, 10, 15, 12, 9, 7, 8, 7)
names(absent) <- c("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC")

# (1)
print(absent)

# (2)
print(absent["MAY"])

# (3)
print(absent[c("JUL", "SEP")])

# (4)
print(absent[1:6])

# (5)
print(absent[7:12])
