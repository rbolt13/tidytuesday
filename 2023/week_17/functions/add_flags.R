#### Week 17 - London Marathon ####
# Title: Add Flags Function
# Description: A function that 
# takes in a stylized data visual
# and adds flags.
here::i_am("2023/week_17/functions/add_flags.R")

#### Load Packages #### 
# ggplot2: graphing functions. 
# grid: functions to graph objects. 
library(ggplot2)
library(grid)

#### Load Data ####
# flags_list: list of flags. 
flags_list <- readRDS("2023/week_17/data/flag_list.RData")

#### Add Flags ####
# annotation_custom(): add static annotations.
# rasterGrob(): render image at given location.
add_flags <- function(styled_vis){
  for (i in 1:length(flags_list)){
    flag_new <- styled_vis + 
      ggplot2::annotation_custom(
        grid::rasterGrob(
          flags_list[[i]], 
          width=1, height=1),
        xmin = -2, xmax = -.1,
        ymin = 24.55-i, ymax = 25.45-i)
    styled_vis <- flag_new
  }
  return(flag_new)
}