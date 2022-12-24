# ----------------------------------------------------------------------------------------------- #
# - plotting puzzle data ------------------------------------------------------------------------ #
# ----------------------------------------------------------------------------------------------- #

# packages and data

pacman::p_load(tidyverse, hrbrthemes)
d <- read.csv('./data/asr_puzzlecounts.csv') 

# create article percentages

d <- d |> 
  mutate(per = puzzle/asr)

# plot the trajectory

png("puzzles.png", w = 8, h = 6, res = 500, units = "in")
d |> 
  ggplot(aes(x = year, y = per)) +
  geom_point(col = "#C27D38") +
  geom_smooth(se = F, col = "#798E87", linewidth = 0.75) +
  theme_ipsum() +
  labs(
    title = "Puzzling in Sociology",
    subtitle = "The Prevalence of the Word Puzzle in the American Sociological Review, 1936-2019",
    x = "Year", y = "% Usage of the Word Puzzle"
  ) +
  scale_x_continuous(breaks = seq(1936, 2019, 10)) +
  scale_y_continuous(labels = scales::percent)
dev.off()

# ----------------------------------------------------------------------------------------------- #
