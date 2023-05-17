#### Week 8 - Bob Ross ####
# Title: Style Function
# Date: May 17, 2023
# Description: A function that takes
# in a data visual and styles it. 
here::i_am("2023/week_08/functions/sty.R")

#### Load Packages ####
# ggplot2: graphing functions. 
base::library(ggplot2)

#### Style Function ####
# labs(): define labels.  
sty <- function(vis){
  sty <- vis +
    ggplot2::labs(
      title = "Colors Used Each Season",
      subtitle = "The dashed red line shows the average number of colors used each season, 137.871.",
      caption = "Graph by Randi Bolt | Data from #TidyTuesday",
      x = "Season",
      y = "Colors Used"
    )
  return(sty)
  }
    