#### Week 8 - Bob Ross ####
# Title: Index 
# Date: May 17, 2023
# Description: This file loads in the
# necessary packages, functions, and data.
# Then it cleans the data, creates a data 
# visual, stylizes the visual, and saves the 
# visual as a png file. 
here::i_am("2023/week_08/index.R")

#### Load Packages ####
# tidyverse: A collection of data-related packages.
base::library(tidyverse)

#### Load Functions ####
# clean(): cleans the data. 
# vis(): creates a data visual.
# sty(): stylizes a data visual.
base::source("2023/week_08/functions/clean.R")
base::source("2023/week_08/functions/vis.R")
base::source("2023/week_08/functions/sty.R")

#### Load Data ####
# bob_ross: data about and from "The Joy of Painting".
bob_ross <- read_csv("https://raw.githubusercontent.com/jwilber/Bob_Ross_Paintings/master/data/bob_ross_paintings.csv")

#### Clean Data ####
clean_data <- clean(bob_ross)

#### Create Data Visual ####
vis_data <- vis(clean_data)

#### Style Data Visual ####
sty_vis <- sty(vis_data)

#### Save Plot ####
ggsave(
  "2023/week_08/plot.png", 
  width = 30, 
  height = 20, 
  units = "cm")
