#### Week 22 - Verified Oldest People ####
# Title: Visual Function 
# Date: May 31, 2023
# Description: A function that takes
# in a clean data set and creates a 
# data visual from it. 
here::i_am("2023/week_22/functions/vis.R")

#### Load Packages ####
# ggplot2: graphing functions.
base::library(ggplot2)

#### Visual Function ####
vis <- function(clean_df){
  vis <- ggplot2::ggplot(
    clean_df,
    ggplot2::aes(x = death_month, y = count, fill = to_highlight)) +
    geom_bar(stat = "identity")
  return(vis)
}