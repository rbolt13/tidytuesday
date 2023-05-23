#### Week 21 - Squirrel Census ####
# Title: Visual Function
# Date: May 22, 2023
# Description: A function that takes
# in a clean data set and creates a 
# data visual from it. 
here::i_am("2023/week_21/functions/vis.R")

#### Load Packages ####
# ggplot2: graphing functions.
# treemapify: tree mapping functions.
base::library(ggplot2)
base::library(treemapify)

#### Visual Function ####
# ggplot(): initialize ggplot object.
# aes(): define variable mapping.
# paste(): concatenate vectors.
# geom_treemap(): creates tree map. 
vis <- function(clean_df){
  vis <- ggplot2::ggplot(
    clean_df,
    ggplot2::aes(
      area = value,
      fill = Group,
      label = base::paste(subgroup, value, sep = ": "))) +
    treemapify::geom_treemap()
  return(vis)
}