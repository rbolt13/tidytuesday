#### Week 25 - UFO Sightings Redux ####
# Title: Visual Function 
# Date: June 22, 2023
# Description: A function that takes
# in a clean data set and creates a 
# data visual from it. 
here::i_am("2023/week_25/functions/vis.R")

#### Load Packages ####
# ggplot2: graphing functions.
base::library(ggplot2)

#### Visual Function ####
vis <- function(clean_df){
  vis <- ggplot2::ggplot(
    clean_df,
    ggplot2::aes(x = shape,
                 y = duration_minutes,
                 fill = shape,
                 color = shape)) +
    geom_boxplot(outlier.shape = NA) +
    geom_jitter(
      na.rm = TRUE, 
      color = "#d2ff46", 
      alpha = 0.7)
  return(vis)
}