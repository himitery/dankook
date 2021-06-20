santa <- data.frame(
    belief = c(
        "no belief", "no belief", "no belief", "no belief",
        "belief", "belief", "belief", "belief",
        "belief", "belief", "no belief", "no belief",
        "belief", "belief", "no belief", "no belief"
    ),
    sibling = c(
        "older brother", "older brother", "older brother", "older brother",
        "no older brother", "no older brother", "no older brother", "older brother",
        "older brother", "older brother", "older brother", "older brother",
        "no older brother", "older brother", "older brother", "no older brother"
    )
)

mosaicplot(~belief + sibling, data = santa, color = TRUE)
