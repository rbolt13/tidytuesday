#### Week 19 - Childcare Costs ####
# Title: Visual Function
# Date: May 18, 2023
# Description: A function that takes 
# in a clean data set and creates a 
# data visual from it. 
here::i_am("2023/week_19/functions/vis.R")

#### Load Packages ####
# ggplot2: graphing functions.
base::library(ggplot2)

#### Visual Function ####
# ggplot(): initialize ggplot object.
# aes(): define variable mapping.
# geom_jitter():creates jitter graph.
# facet_wrap(): wrap graph panels. 
vis <- function(clean_df){
  vis <- ggplot2::ggplot(
    clean_df,
    ggplot2::aes(
      x = study_year,
      y = per_emply,
      group = Gender)
  ) +
    ggplot2::geom_jitter(
      ggplot2::aes(color = Gender)
    ) +
    ggplot2::facet_wrap(~industry)
  return(vis)
}