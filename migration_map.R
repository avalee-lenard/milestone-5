library(ggplot2)
library(dplyr)

turtles <- read.csv("data/sea_turtle_observations.csv")

atlantic <- turtles %>%
  filter(
    decimalLongitude >= -85,
    decimalLongitude <= 10,
    decimalLatitude >= -5,
    decimalLatitude <= 65
  )

cat("Atlantic observations:", nrow(atlantic), "\n")

p <- ggplot() +
  geom_point(
    data = atlantic,
    aes(x = decimalLongitude, y = decimalLatitude),
    color = "darkcyan",
    alpha = 0.18,
    size = 0.6
  ) +
  annotate("point", x = -78.7, y = 26.5,
           color = "red", size = 4) +
  annotate("text", x = -78.7, y = 29,
           label = "Freeport, Bahamas") +
  annotate("point", x = -25.7, y = 37.7,
           color = "red", size = 4) +
  annotate("text", x = -25.7, y = 40,
           label = "Azores") +
  coord_cartesian(xlim = c(-85, 10), ylim = c(-5, 65)) +
  labs(
    title = "Sea Turtle Observations Across the Atlantic",
    subtitle = "Real geographic tracking records from OBIS",
    x = "Longitude",
    y = "Latitude",
    caption = "Source: Ocean Biodiversity Information System (OBIS)"
  ) +
  theme_minimal()

ggsave("migration_map.png", p, width = 12, height = 8, dpi = 300)
