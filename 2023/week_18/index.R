#### Week 18 - Portal Project ####
# Title: Index
# Date: May 17, 2023
# Description: This file loads in the
# necessary packages, functions, and data.
# Then it cleans the data, creates a data 
# visual, stylizes the visual, and saves the 
# visual as a png file. 
here::i_am("2023/week_18/index.R")

#### Load Packages ####
# tidyverse: A collection of data-related packages
base::library(tidyverse) 

#### Load Functions ####
# clean(): cleans the data. 
# vis(): creates a data visual.
# sty(): stylizes a data visual.
base::source("2023/week_18/functions/clean.R")
base::source("2023/week_18/functions/vis.R")
base::source("2023/week_18/functions/sty.R")

#### Load Data ####
surveys <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-05-02/surveys.csv')

#### Clean Data ####
clean_data <- clean(surveys)

#### Create Data Visual ####
vis_data <- vis(clean_data)

#### Style Data Visual ####
sty_vis <- sty(vis_data)

#### Save Plot ####
ggsave(
  "2023/week_18/plot.png", 
  width = 10, 
  height = 8, 
  dpi = 150,
  units = "in")