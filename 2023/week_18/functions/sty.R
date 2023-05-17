#### Week 18 - Portal Project ####
# Title: Style Function
# Date: May 17, 2023
# Description: A function that takes
# in a data visual and styles it. 
here::i_am("2023/week_18/functions/sty.R")

#### Load Packages ####
# ggplot2: graphing functions. 
base::library(ggplot2)

#### Load Colors ####
col1 <- "#232741"
col2 <- "#C58C60"
col3 <- "#D3DAD9"
col4 <- "#A76858"

#### Style Function ####
# labs(): define labels.
# scale_continuous(): set x and y scales. 
# geom_text(): label points.
# theme(): modify theme. 
sty <- function(vis){
  sty <- vis +
    ggplot2::labs(
      title = "Swollen Testicles of Merriam's Kangaroo Rat by Month and Year near Portal, AZ",
      subtitle = "The Portal Project is a long-term ecological study being conducted near Portal, AZ.\nThis chart shows the number of Merriam's Kangaroo Rat with swollen testicles by month and year over the past 45 years.",
      x = "Month",
      y = "Number of Rodents",
      caption = "Graph by Randi Bolt \n Data from #TidyTuesday and Portal Project",
      alt = "This is a point and line graph showing swollen testicles of Merriam's Kangaroo Rat by months and year over the past 45 years. The x axis shows months, and the y axis shows number of rodents.") +
    ggplot2::scale_x_continuous(
      breaks = seq(1,12,1)) + 
    ggplot2::scale_y_continuous(
      breaks = seq(0,60,10)) +
    ggplot2::geom_text(
      ggplot2::aes(
        label = n,
        vjust = -0.2)) +
    ggplot2::theme(
      # title
      plot.title = element_text(
        size = 16,
        face = "bold",
        color = col1,
        hjust = .5),
      # subtitle
      plot.subtitle = element_text(
        size = 12,
        hjust = .5,
        color = col1),
      # plot background
      plot.background = element_rect(
        fill = col2),
      # graph background
      panel.background = element_rect(
        fill = col3),
      # x and y axis labels
      axis.title = element_text(
        size = 14, 
        color = col1),
      # legend background
      legend.background = element_rect(
        fill = col2),
      # facet graph titles
      strip.background = element_rect(
        fill = col4))
  return(sty)
}