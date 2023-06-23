#### Week 25 - UFO Sightings Redux ####
# Title: Style Function 
# Date: June 12, 2023
# Description: A function that takes
# in a data visual and styles it. 
here::i_am("2023/week_25/functions/sty.R")

#### Load Packages ####
# ggplot2: graphing functions.
# showtext: font functions. 
base::library("ggplot2")
base::library("showtext")

#### Load Fonts ####
sysfonts::font_add_google("Orbitron", "font")
showtext::showtext_auto()

#### Load Colors ####
col1 <- "#d2ff46"
col2 <- "#0d0d0d"
col3 <- "white"

#### Axis Labels ####
axis_labs <- c("changing", "orb", "formation", "oval", "unknown",
               "cigar", "rectangle", "circle", "egg", "sphere", 
               "other", "light", "triangle", "teardrop", "cross",
               "diamond", "cylinder", "disk", "fireball", "not available", 
               "flash", "chevron", "cone")

#### Style Function ####
sty <- function(vis){
  sty <- vis +
    # labs
    ggplot2::labs(
      title = "Shapes in Oregon: Short Sightings",
      subtitle = "\nThe following box plot displays the distribution of UFO sightings lasting less than 5 minutes in Oregon, categorized by \ntheir reported shape. Among this subset of sightings, Cylinder, Disk, Fireball, Not Available, Flash, Chevron, and Cone \nwere more frequently reported with durations of less than two minutes. In contrast, the Changing UFO shape was \nobserved for a broader duration range, spanning from 2 to 5 minutes. \n\nThe asterisk (*) denotes the mean duration in minutes.\n ",
      caption = "Randi Bolt - June 2023 \n#TidyTuesday: UFO Sightings Redux",
      x = "Shape",
      y = "Duration in Minutes")  +
    # x and y axis
    ggplot2::scale_y_continuous(limits = c(0,5)) + 
    ggplot2::scale_x_discrete(limits = axis_labs) +
    # variable color and fill colors
    ggplot2::scale_color_viridis_d() +
    ggplot2::scale_fill_viridis_d(alpha = 0.6) +
    # mean point
    stat_summary(fun = mean, geom = "point", shape = 8, size = 4) +
    # theme
    ggplot2::theme(
      # labs 
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
      axis.text.x = element_text(
        angle = 55,
        vjust = .7), 
      plot.background = element_rect(fill = col2),
      panel.background = element_rect(fill = col2),
      panel.grid.major.x = element_blank(),
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank(),
      legend.position = "none") 
  return(sty)
}