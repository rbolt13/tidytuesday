#### Week 24 - SAFI ####
# Title: Visual Function 
# Date: June 12, 2023
# Description: A function that takes
# in a clean data set and creates a 
# data visual from it. 
here::i_am("2023/week_24/functions/vis.R")

#### Load Packages ####
# ggplot2: graphing functions.
base::library(ggplot2)

#### Visual Function ####
vis <- function(clean_df){
  vis <- ggplot2::ggplot(
    clean_df,
    ggplot2::aes(x = rooms, y = liv_count, fill = n)) +
    geom_tile()
  return(vis)
}