#### Week 19 - Childcare Costs ####
# Title: Index
# Date: May 18, 2023
# Description: This file loads in the 
# necessary packages, functions, and data.
# Then it cleans the data, creats a data 
# visual, stylizes the visual, and saves
# the visual as a png file. 
here::i_am("2023/week_19/index.R")

#### Load Packages ####
# tidyverse: A collection of data-related packages
base::library(tidyverse)

#### Load Functions #### 
# clean(): cleans the data. 
# vis(): creates a data visual.
# sty(): stylizes a data visual.
base::source("2023/week_19/functions/clean.R")
base::source("2023/week_19/functions/vis.R")
base::source("2023/week_19/functions/sty.R")

#### Read in the data ###
childcare_costs <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-05-09/childcare_costs.csv')
counties <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-05-09/counties.csv')

#### clean the data #### 
clean_data <- clean(childcare_costs, counties)

#### Create Data Visual ####
vis_data <- vis(clean_data)

#### Stylize Visual ####
sty_vis <- sty(vis_data)

#### Save Plot ####
ggsave(
  "2023/week_19/plot.png", 
  width = 30, 
  height = 20, 
  units = "cm")