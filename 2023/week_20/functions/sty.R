#### Week 20 - Tornadoes data ####
# Title: Style Function
# Date: May 17, 2023
# Description: A function that takes
# in a data visual and styles it. 
here::i_am("2023/week_20/functions/sty.R")

#### Load Packages ####
# ggplot2: graphing functions. 
# showtext: define font. 
base::library(ggplot2)
base::library(showtext)

#### Load Fonts ####
sysfonts::font_add_google("Montserrat", "font")
sysfonts::font_add_google("Montserrat", "font2")
showtext::showtext_auto()

#### Load Colors ####
col1 <- "#264694"
col7 <- "#4898d7"
col3 <- "#D6DCE1"
col4 <- "#DAB362"
col5 <- "#737373"
col6 <- "#4D5BA2"
col2 <- "#7EBED8"
risk_cols <- c(
  "#c1e9c1", "#40b050", "#faff04", 
  "#f2a32a", "#ed0204", "#f200ff")

#### Style Function ####
# labs(): add text labels. 
# scale_continuous(): set scales. 
# scale_fill_manual(): set col colors.
# geom_text(): add text. 
# theme(): define theme. 
sty <- function(vis){
  sty <- vis +
    ggplot2::labs(
      title = "Tornado Severity by Month",
      subtitle = "The months that saw the most tornadoes were April - June, and the majority of tornadoes were below magnitude 2",
      caption = "Period 1950 - 2021 | Graph by Randi Bolt | Data from #TidyTuesday: NOAA",
      x = "Month",
      y = "Number of Tornadoes")  +
    ggplot2::scale_x_continuous(breaks = seq(1,12,1)) + 
    ggplot2::scale_y_continuous(breaks = seq(0,8000,1000)) +
    ggplot2::scale_fill_manual(values = risk_cols) +
  ggplot2::geom_text(
    ggplot2::aes(
      label = value,
      vjust = -.2,
      family = "font"),
    size = 10) +
    ggplot2::theme(
      # title
      plot.title = element_text(
        size = 80,
        family = "font",
        hjust = .5),
      # subtitle
      plot.subtitle = element_text(
        size = 35,
        family = "font2",
        hjust = .5),
      # caption
      plot.caption = element_text(
        size = 25,
        family = "font2",
        hjust = .5),
      # axis title
      axis.title = element_text(
        size = 60,
        family = "font"),
      # axis text
      axis.text = element_text(
        size = 40,
        family = "font"),
      # legend title
      legend.title = element_text(
        size = 50,
        family = "font"),
      # legend text
      legend.text = element_text(
        size = 40,
        family = "font"),
      # facet wrap text
      strip.text = element_text(
        size = 40,
        family = "font"),
      # colors
      plot.background = element_rect(fill = col2),
      legend.background = element_rect(
        fill = col3,
        linewidth = 0.5,
        linetype = "solid",
        color = col4),
      panel.background = element_rect(fill = col3),
      strip.background = element_rect(fill = col4))
  return(sty)
}