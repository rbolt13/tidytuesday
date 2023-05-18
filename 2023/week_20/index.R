#### Week 20 - Tornadoes data ####
# Title: Index
# Date: May 18, 2023
# Description: This file loads in the 
# necessary packages, functions, and data. 
# Then it cleans the data, creates a data 
# visual out the data, stylizes the visual,
# and saves the stylized visual as a png. 
here::i_am("2023/week_20/index.R")

#### Load Packages ####
# tidyverse: A collection of data-related packages.
base::library(tidyverse)

#### Load Functions ####
# clean(): cleans the data.
# vis(): creates a data visual.
# sty(): stylizes the visual. 
base::source("2023/week_20/functions/clean.R")
base::source("2023/week_20/functions/vis.R")
base::source("2023/week_20/functions/sty.R")

#### Load Data ####
# tornadoes: tornado data.
tornadoes <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-05-16/tornados.csv')

#### Clean Data ####
clean_data <- clean(tornadoes)

#### Create Data Visual ####
vis_data <- vis(clean_data)

#### Style Data Visual ####
sty_vis <- sty(vis_data)

#### Save Plot ####
ggsave(
  "2023/week_20/plot.png", 
  width = 30, 
  height = 20, 
  units = "cm")
