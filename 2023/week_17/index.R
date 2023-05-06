#### Workspace setup ####
# tidyverse: A collection of data-related packages
base::library(tidyverse) 
base::library(png)
# functions 
base::source("2023/week_17/functions/clean.R")
base::source("2023/week_17/functions/vis.R")
base::source("2023/week_17/functions/style.R")
base::source("2023/week_17/functions/add_flags.R")
# colors
geom_bar_color <- "#DD733A"
background_color <- "#596D78"
title_color <- "#ABB3B8"
graph_color <- "#ABB3B8"
bonus_1 <- "#4F555B"
bonus_2 <- "#B4AE59"
# text
title <- "Nationality of London Marathon Winners"
subtitle <- ""
caption <- "Graph by Randi Bolt \n Data from #TidyTuesday"
xlab <- "Number of Winners"
ylab <- " "

#### Read in the data ####
remotes::install_github("nrennie/LondonMarathon")
data(winners, package = "LondonMarathon")
flag_list <- readRDS("2023/week_17/data/flag_list.RData")

#### Clean the data ####
data <- clean(winners)

#### Create Data Visual ####
data_vis <- vis(
  data, 
  geom_bar_color)

#### Style Data Visual ####
sty_vis <- style(
  data_vis,
  title,
  subtitle,
  caption,
  xlab,
  ylab,
  background_color,
  title_color,
  graph_color)

#### Add Flags ####
sty_vis_with_flags <- add_flags(
  sty_vis, 
  flag_list)

#### Save Plot ####
ggsave(
  "2023/week_17/plot.png", 
  width = 30, 
  height = 20, 
  units = "cm")
