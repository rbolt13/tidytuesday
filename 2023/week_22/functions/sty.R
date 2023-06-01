#### Week 22 - Verified Oldest People ####
# Title: Style Function 
# Date: May 31, 2023
# Description: A function that takes
# in a data visual and styles it. 
here::i_am("2023/week_22/functions/sty.R")

#### Load Packages ####
# ggplot2: graphing functions.
# ggchicklet: to round graph bars. 
base::library(ggplot2)
base::library(ggchicklet)

#### Load Fonts ####
sysfonts::font_add_google("EB Garamond", "font")
showtext::showtext_auto()

#### Load Colors ####
col1 <- "white"
col2 <- "#0d0d0d"
col3 <- "#b22b2e"
col4 <- "#6d6a6e"

#### Style Function ####
sty <- function(vis){
  sty <- vis +
    # labs
    ggplot2::labs(
      title = "High Number of Centenarian Deaths in January",
      subtitle = "Of the 200 oldest verified men and women,\n the most common month for a centarian to die in is January.",
      caption = "\nRandi Bolt ~ #TidyTuesday - Verified Oldest People ~ May 2023",
      x = "Death Month",
      y = "Count")  +
    # ylim
    ylim(0, 36) +
    # add numbers above boxes
    ggplot2::geom_text(
      ggplot2::aes(
        label = count,
        vjust = -.5),
      color = col1,
      size = 20
    ) + 
    # scales 
    ggplot2::scale_x_discrete(
      labels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "Alive")
    ) +
    scale_fill_manual(values  = c("yes" = col3, "no"= col4), guide = "none") + 
    # theme
    ggplot2::theme(
      plot.title = element_text(
        size = 100,
        family = "font",
        face = "bold",
        hjust = .5,
        vjust = -5,
        color = col1),
      plot.subtitle = element_text(
        size = 55,
        family = "font",
        hjust = .5,
        vjust = -20,
        color = col1),
      plot.caption = element_text(
        size = 30,
        family = "font",
        hjust = .5,
        color = col1),
      axis.title = element_text(
        size = 50, 
        family = "font",
        face = "bold",
        color = col1),
      axis.text = element_text(
        size = 45, 
        family = "font",
        color = col1),
      axis.text.x = element_text(angle = 25), 
      plot.background = element_rect(fill = col2),
      panel.background = element_rect(fill = col2),
      panel.grid.major.x = element_blank(),
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank()) +               
    # ggplot2 barplot with round corners
    geom_chicklet(radius = grid::unit(3, "mm")) 
  return(sty)
}