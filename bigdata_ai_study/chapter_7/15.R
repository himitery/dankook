# (1)
authors <- data.frame(
    surname = c("Twein", "Venables", "Tierney", "Ripley", "McNeil"),
    nationality = c("US", "Australia", "US", "UK", "Australia"),
    retired = c("yes", rep("no", 4))
)

books <- data.frame(
    name = c("Johns", "Venables", "Tierney", "Ripley", "Ripley", "McNeil"),
    title = c("Exploratory Data Analysis", "Modern Applied Statistics ...", "LISP-STAT", "Spatial Statistics", "Stochastic Simulation", "Interactive Data Analysis"),
    other.author = c(NA, "Ripley", NA, NA, NA, NA)
)

print(authors)
print(books)

# (2)
merge(authors, books, by.x = c("surname"), by.y = c("name"))

# (3)
merge(authors, books, by.x = c("surname"), by.y = c("name"), all.x = T)

# (4)
merge(authors, books, by.x = c("surname"), by.y = c("name"), all.y = T)

# (5)
merge(authors, books, by.x = c("surname"), by.y = c("other.author"))
