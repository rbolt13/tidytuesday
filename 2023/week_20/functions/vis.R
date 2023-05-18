#### Week 20 - Tornadoes data ####
# Title: Visual Function
# Date: May 16, 2023
# Description: A function that takes
# in a clean data set and creates a 
# data visual from it. 
here::i_am("2023/week_20/functions/vis.R")

#### Load Packages ####
# ggplot2: graphing functions. 
base::library(ggplot2)

#### Visual Function ####
# ggplot(): initialize ggplot object.
# aes(): define variable mapping.
# geom_bar(): create bar graph.
# facet_wrap(): wraps graph panels. 
vis <- function(clean_df){
  vis <- ggplot2::ggplot(
    clean_df,
    ggplot2::aes(
      fill = Magnitude,
      x = mo,
      y = value)) +
    ggplot2::geom_bar(
      position = "dodge",
      stat = "identity")  +
     ggplot2::facet_wrap(~Magnitude)
  return(vis)
}