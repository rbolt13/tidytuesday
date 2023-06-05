#### Week 8 - Bob Ross ####
# Title: Visual Function
# Date: May 17, 2023
# Description: A function that takes
# in a clean data set and creates a 
# data visual from it. 
here::i_am("2023/week_08/functions/vis.R")

#### Load Packages ####
# ggplot2: graphing functions. 
base::library(ggplot2)

#### Visual Function ####
# ggplot(): initialize ggplot object.
# aes(): defines variable mapping.
# geom_col(): create bar graph. 
# geom_hlin(): add horizontal line at avg.
vis <- function(clean_df){
  vis <- ggplot2::ggplot(
    clean_df,
    ggplot2::aes(
      x = season,
      y = total_num_colors)) +
    ggplot2::geom_point() + 
    ggplot2::geom_segment(
      ggplot2::aes(
        x = season,
        xend = season,
        y = 0,
        yend = total_num_colors)) + 
    ggplot2::geom_hline(
      yintercept=137.871, 
      linetype="dashed", 
      color = "red") +
    ggplot2::geom_text(
      ggplot2::aes(label = total_num_colors,
                   vjust = -1)
    )
  return(vis)
}