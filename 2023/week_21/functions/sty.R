#### Week 21 - Squirrel Census ####
# Title: Style Function
# Date: May 22, 2023
# Description: A function that takes
# in a data visual and styles it. 
here::i_am("2023/week_21/functions/sty.R")

#### Load Packages ####
# ggplot2: graphing functions.
# treemapify: tree mapping functions.
# showtext: define font. 
# png: read png img. 
# cowplot: add img to plot. 
base::library(ggplot2)
base::library(treemapify)
base::library(showtext)
base::library(png)
base::library(cowplot)

#### Load Fonts ####
sysfonts::font_add_google("Playfair Display", "font")
showtext::showtext_auto()

#### Load Imgs ####
acorn <- png::readPNG("2023/week_21/img/acorn-frame.png")
gs_ch <- png::readPNG("2023/week_21/img/gs-ch.png")
gs_wh <- png::readPNG("2023/week_21/img/gs-wh.png")
gs_cwh <- png::readPNG("2023/week_21/img/gs-cwh.png")
cs_gh <- png::readPNG("2023/week_21/img/cs_gh.png")
cs_wh <- png::readPNG("2023/week_21/img/cs_wh.png")
cs_gwh <- png::readPNG("2023/week_21/img/cs_gwh.png")

#### Load Colors ####
col1 <- "white"
col2 <- "#0d0d0d"
col3 <- "#b22b2e"
col4 <- "#fdfcfa"
col5 <- "#6d6a6e"
group_cols <- c("#0d0d0d", "#b22b2e", "#6d6a6e", "#aea495")

#### Style Function ####
# labs(): add text labels. 
# scale_continuous(): set scales. 
# scale_fill_manual(): set col colors.
# geom_text(): add text. 
# theme(): define theme. 
sty <- function(vis){
  sty <- vis +
    treemapify::geom_treemap_text(
      color = col1,
      place = "top",
      size = 30
    ) +
    ggplot2::labs(
      title = "Fur Color and Highlight Variations",
      subtitle = "The majority of observed squirrels exhibited gray fur color, often accompanied by either NA or cinnamon highlights.",
      caption = "Graph by Randi Bolt | Data from #TidyTuesday: The Squirrel Census | Data Date: October 2020",)  +
    ggplot2::scale_fill_manual(values = group_cols) +
    ggplot2::guides(fill=guide_legend(title = "Fur Colors")) + 
    ggplot2::theme(
      plot.title = element_text(
        size = 90,
        family = "font",
        face = "bold",
        hjust = .5,
        color = col3),
      plot.subtitle = element_text(
        size = 25,
        family = "font",
        hjust = .5,
        color = col2),
      plot.caption = element_text(
        size = 25,
        family = "font",
        hjust = .5),
      legend.title = element_text(
        size = 50,
        family = "font",
        face = "bold",
        color = col2),
      legend.text = element_text(
        size = 30,
        family = "font",
        color = col2),
      legend.position = "bottom",
      plot.background = element_rect(fill = col4)) +
    # Gray NA: 895
    draw_image(acorn, x = -0.25, y = -0.25, scale = .5) +
    # Black NA: 74
    draw_image(acorn, x = 0.14, y = 0.46, scale = .1) +
    # NA NA: 55
    draw_image(acorn, x = 0.311, y = 0.388, scale = .09) +
    # Cinnamon NA: 62 
    draw_image(acorn, x = 0.311, y = 0.25, scale = .1) +
    # Gray Cinnamon: 752
    draw_image(gs_ch, x = -0.25, y = 0.28, scale = .4) +
    # Gray White: 489
    draw_image(gs_wh, x = 0.3, y = -0.36, scale = .32) +
    # Gray Cinnamon White: 265
    draw_image(gs_cwh, x = 0.21, y = 0, scale = .28) +
    # Cinnamon Gray: 162
    draw_image(cs_gh, x = 0.456, y = 0, scale = .21) +
    # Cinnamon White: 94
    draw_image(cs_wh, x = 0.14, y = 0.276, scale = .15) +
    # Cinnamon Gray, White: 59
    draw_image(cs_gwh, x = 0.47, y = 0.25, scale = .1)
  return(sty)
}