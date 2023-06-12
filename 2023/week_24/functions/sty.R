#### Week 24 - SAFI Data ####
# Title: Style Function 
# Date: June 12, 2023
# Description: A function that takes
# in a data visual and styles it. 
here::i_am("2023/week_24/functions/sty.R")

#### Load Packages ####
# ggplot2: graphing functions.
# showtext: font functions. 
base::library("ggplot2")
base::library("showtext")

#### Load Fonts ####
sysfonts::font_add_google("Judson", "font")
showtext::showtext_auto()

#### Load Colors ####
col1 <- "white"
col2 <- "#3E3D53"
col3 <- "#2C6E63"
col4 <- "#FCE100"

#### Style Function ####
sty <- function(vis){
  sty <- vis +
    # labs
    ggplot2::labs(
      title = "Relationship Between Live Stock Ownership and Number of Rooms in Household",
      subtitle = "This subset of the SAFI (Studying African Farmer-Led Irrigation) data shows that of the 131 people surveyed most lived in a house with 1 room,\n and had between 1 cattle. There is no obvious evidence to indicate that the number of rooms in a home is related to the number of live stock owned.",
      caption = "Randi Bolt - June 2023 \n#TidyTuesday: SAFI Data - June 2017",
      x = "Rooms",
      y = "Live Stock",
      fill = "Surveyed")  +
    # add numbers in boxes
    ggplot2::geom_text(
      ggplot2::aes(label = n),
      color = col1,
      size = 12,
      family = "font") + 
    # scale color
    ggplot2::scale_fill_gradient(low = col3, high = col4) +
    # Axis Breaks 
    ggplot2::scale_x_continuous(
      breaks = seq(1,8,1)) + 
    ggplot2::scale_y_continuous(
      breaks = seq(1,5,1)) + 
 # theme
    ggplot2::theme(
      plot.title = element_text(
        size = 30,
        family = "font",
        face = "bold",
        hjust = 0,
        color = col1),
      plot.subtitle = element_text(
        size = 18,
        family = "font",
        hjust = 0,
        color = col1),
      plot.caption = element_text(
        size = 12,
        family = "font",
        hjust = 1,
        color = col1),
      axis.title = element_text(
        size = 24, 
        family = "font",
        color = col1),
      axis.text = element_text(
        size = 18, 
        family = "font",
        color = col1),
      legend.title = element_text(
        size = 24,
        family = "font",
        color = col1),
      legend.text = element_text(
        size = 16,
        family = "font",
        color = col1),
      plot.background = element_rect(fill = col2),
      panel.background = element_rect(fill = col2),
      panel.grid.major.x = element_blank(),
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank(),
      legend.background = element_rect(fill = col2))
  return(sty)
}