#' Create a graph
#' 
#' 

here::i_am("2023/week_08/index.R")

library(tidyverse)

bob_ross <- read_csv("https://raw.githubusercontent.com/jwilber/Bob_Ross_Paintings/master/data/bob_ross_paintings.csv")

br_colors <- bob_ross %>%
  group_by(season) %>%
  summarise(total_num_colors = sum(num_colors))

plot <- ggplot(
  br_colors, 
  aes(x = season, 
      y = total_num_colors)) +
  geom_col(fill = "#6c464e") +
  ggtitle("Colors Used Each Season") +
  xlab("Season") +
  ylab("Colors Used") +
  theme(
    plot.title = element_text(family = "Times"),
    axis.title.x = element_text(family = "Times"),
    axis.title.y = element_text(family = "Times")
  )

png("2023/week_08/plot.png")
print(plot)
dev.off()
