library(tidyverse)

top_songs <- read_rds("clean_data.rds")

billboard_plot <- ggplot(top_songs, aes(x = week, y = rank, group = song, color = weeks_on_chart)) +
  geom_line(linewidth = 1, alpha = 0.8) +
  scale_y_reverse() +
  scale_color_viridis_c(option = "plasma", end = 0.9) +
  labs(
    title = "The songs that stayed on the Billboard chart",
    subtitle = "Each line follows a song's rank over the weeks after it entered the chart",
    x = "Weeks since entering chart",
    y = "Chart rank (1 = highest)",
    color = "Weeks on chart"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    legend.position = "bottom",
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold")
  )

ggsave("billboard.png", plot = billboard_plot)
