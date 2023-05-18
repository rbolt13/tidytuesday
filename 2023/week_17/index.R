#### Week 17 - London Marathon ####
# Title: Index
# Date: May 18, 2023
# Description: This file loads in the 
# necessary packages, functions, and data. 
# Then cleans the data, create a data visual
# out the data, stylizes the visual, and 
# save the stylized visual as a png file. 
here::i_am("2023/week_17/index.R")

#### Load Packages ####
# tidyverse: A collection of data-related packages
# png: format pngs. 
base::library(tidyverse) 
base::library(png)

#### Load Functions ####
# clean(): cleans the data.
# vis(): creates a data visual.
# sty(): stylizes the visual. 
base::source("2023/week_17/functions/clean.R")
base::source("2023/week_17/functions/vis.R")
base::source("2023/week_17/functions/style.R")
base::source("2023/week_17/functions/add_flags.R")

#### Load Data ####
remotes::install_github("nrennie/LondonMarathon")
data(winners, package = "LondonMarathon")

#### Clean Data ####
data <- clean(winners)

#### Create Data Visual ####
data_vis <- vis(data)

#### Style Data Visual ####
sty_vis <- style(data_vis)

#### Add Flags ####
sty_vis_with_flags <- add_flags(sty_vis)

#### Save Plot ####
ggsave(
  "2023/week_17/plot.png", 
  width = 30, 
  height = 20, 
  units = "cm")
