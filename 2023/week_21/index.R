#### Week 21 - Squirrel Census ####
# Title: Index
# Date: May 22, 2023
# Description: This file loads in the 
# necessary packages, functions, and data. 
# Cleans the data, creates a data visual, 
# stylizes the visual, and then saves the 
# stylized visual as a .png file. 
here::i_am("2023/week_21/index.R")

#### Load Packages ####
# tidyverse: A collection of data-related packages.
base::library(tidyverse)

#### Load Functions ####
# clean(): cleans the data.
# vis(): creates a data visual.
# sty(): stylizes the visual. 
base::source("2023/week_21/functions/clean.R")
base::source("2023/week_21/functions/vis.R")
base::source("2023/week_21/functions/sty.R")

#### Load Data ####
# squirrel_data: squirrel census data.
squirrel_data <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-05-23/squirrel_data.csv')

#### Clean Data ####
clean_data <- clean(squirrel_data)

#### Create Data Visual ####
vis_data <- vis(clean_data)

#### Style Data Visual ####
sty_vis <- sty(vis_data)

#### Save Plot ####
ggsave(
  "2023/week_21/plot.png")
