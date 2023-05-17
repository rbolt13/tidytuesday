#### Week 18 - Portal Project ####
# Title: Visual Function
# Date: May 17, 2023
# Description: A function that takes
# in a clean data set and creates a 
# data visual from it. 
here::i_am("2023/week_18/functions/vis.R")

#### Load Packages ####
# ggplot2: graphing functions. 
base::library(ggplot2)

#### Visual Function ####
# ggplot(): initialize ggplot object.
# aes(): defines variable mapping.
# geom_point(): create dot plot.
# facet_wrap(): wraps panels by year.
vis <-  function(df){
  vis <- ggplot2::ggplot(
    df, 
    ggplot2::aes(
      x = month,
      y = n,
      group = year)
  ) +
    ggplot2::geom_point(size=1) +
    ggplot2::facet_wrap(~year)
  return(vis)
}