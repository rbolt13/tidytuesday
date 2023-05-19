#### Week 19 - Childcare Costs ####
# Title: Style Function
# Date: May 18, 2023
# Description: A function that takes 
# in a data visual and styles it. 
here::i_am("2023/week_19/functions/vis.R")

#### Load Packages ####
# ggplot2: graphing functions.
# showtext: define font.
base::library(ggplot2)
base::library(showtext)

#### Load Fonts ####
# font: default font for all text.
sysfonts::font_add_google("Roboto Condensed", font)
showtext::showtext_auto()

#### Load Colors ####
# col1: all text, and facet_color color.
# col2: graph and legend background color.
# col3: plot and graph color.
# value_colors: color of graph jitter points. 
col1 <- "#ABB3B8" 
col2 <- "#D8D8F6"
col3 <- "#303A2B" 
value_colors = c("#398f89", "#6c4e97")

#### Load Text Sizes ####
# large_text: title text size.
# medium_text: text size for subtitle, 
#   axis_title, legend_title, and facet_text.
# small_text: text size for caption, 
#   axis_label, and legend text.
large_text = 80
medium_text = 40
small_text = 20

#### Style Function ####
# labs(): add label text.
# scale_continuous(): set scales.
# scale_color_manual(): set value colors.
# theme(): define theme.
sty <- function(vis){
  sty <- vis +
    ggplot2::labs(
      title = "Employment and Unemployment Trends in Oregon",
      subtitle = "Shown by industry and gender between 2008 and 2018.",
      caption = "Graph by Randi Bolt\nData from #TidyTuesday: The National Database of Childcare Prices (NDCP)",
      x = "Year",
      y = "Percent"
    ) + 
    ggplot2::scale_x_continuous(breaks = seq(2008,2018,2)) +
    ggplot2::scale_color_manual(values = value_colors) + 
    ggplot2::theme(
      plot.title = element_text(family = "font", size = large_text, color = col1, hjust = .5),
      plot.subtitle = element_text(family = "font", size = medium_text, color = col1, hjust = .5),
      plot.caption = element_text(family = "font", size = small_text, color = col1),
      axis.title = element_text(family = "font", size = medium_text, color = col1),
      axis.text = element_text(size= small_text, color = col1),
      legend.title = element_text(family = "font", size = medium_text, color = col1),
      legend.text = element_text(family = "font", size = small_text, color = col1),
      strip.text = element_text(family = "font", size = medium_text),
      plot.background = element_rect(fill = col3),
      panel.background = element_rect(fill = col2),
      legend.background = element_rect(fill = col3),
      strip.background = element_rect(fill = col1)
    )
  return(sty)
}