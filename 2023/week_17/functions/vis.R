#### Week 17 - London Marathon ####
# Title: Visual Function
# Date: May 18, 2023
# Description: A function that takes
# in a clean data set and creates a 
# data visual from it. 
here::i_am("2023/week_17/functions/vis.R")

#### Load Packages ####
# ggplot2: graphing functions.
library(ggplot2)

#### Load Colors ####
geom_bar_color <- "#DD733A"

#### Visual Function ####
# ggplot(): initialize ggplot object.
# aes(): deine variable mapping.
# reorder(): reorders rows. 
# geom_bar(): create bar graph.
vis <- function(df){
  vis <- ggplot2::ggplot(
    df,
    ggplot2::aes(
      x = nat_winners,
      y = stats::reorder(
        Nationality, 
        nat_winners))) +
    ggplot2::geom_bar(
      stat = "identity",
      fill = geom_bar_color)
  return(vis)
}