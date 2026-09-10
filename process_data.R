library(tidyverse)

data(billboard, package = "tidyr")

top_songs <- billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    values_to = "rank"
  ) |>
  mutate(week = as.integer(week)) |>
  filter(!is.na(rank)) |>
  group_by(track, artist) |>
  mutate(weeks_on_chart = max(week)) |>
  ungroup() |>
  slice_max(weeks_on_chart, n = 10, with_ties = FALSE) |>
  mutate(song = paste(track, artist, sep = " - "))

write_rds(top_songs, file = "clean_data.rds")
