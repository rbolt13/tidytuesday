#### Week 17 - London Marathon ####
# Title: Style Function
# Date: June 18, 2023
# Description: A function that takes
# in a data visual and styles it. 
here::i_am("2023/week_17/functions/style.R")

#### Load Packages ####
# ggplot2: graphing functions.
library(ggplot2)

#### Load Colors ####
background_color <- "#596D78"
title_color <- "#ABB3B8"
graph_color <- "#ABB3B8"
bonus_1 <- "#4F555B"
bonus_2 <- "#B4AE59"

#### Style Function ####
style <- function(vis){
  sty <- vis +
    # labels 
    ggplot2::labs(
      title = "Nationality of London Marathon Winners",
      subtitle = "",
      caption = "Graph by Randi Bolt | Data from #TidyTuesday",
      x = "Number of Winners",
      y = "") +
    # values next to bars
    ggplot2::geom_text(
      ggplot2::aes(label = nat_winners,
                   hjust = 1.2)) +
    ggplot2::theme(
      # title
      plot.title = element_text(
        size = 18,
        face = "bold",
        color = title_color,
        hjust = .5),
      # caption 
      plot.caption = element_text(
        color = title_color),
      # graph background
      panel.background = element_rect(
        fill = graph_color),
      # x and y axis labels
      axis.title = element_text(
        size = 14, 
        color = title_color),
      # axis ticks text
      axis.text = element_text(
        siz = 10,
        color = title_color),
      # background
      plot.backgroun = ggplot2::element_rect(
        fill = background_color
      )
    )
  return(sty)
}