#### Week 24 - SAFI Data ####
# Title: Index 
# Date: June 12, 2023
# Description: This file loads in the
# necessary packages, functions, and data.
# Then it cleans the data, creates a data 
# visual, stylizes the visual, and saves the 
# visual as a png file. 
week <- c("24")

#### Location of File ####
here::i_am(base::paste0("2023/week_", week , "/index.R"))

#### Load Packages ####
# tidyverse: A collection of data-related packages.
# tidytuesdayR: Load TidyTuesday data set. 
base::library(tidyverse)
base::library(tidytuesdayR)

#### Load Functions ####
# clean(): cleans the data. 
# vis(): creates a data visual.
# sty(): stylizes a data visual.
base::source(base::paste0("2023/week_", week , "/functions/clean.R"))
base::source(base::paste0("2023/week_", week , "/functions/vis.R"))
base::source(base::paste0("2023/week_", week , "/functions/sty.R"))

#### Load Data ####
tt_data <- tidytuesdayR::tt_load(2023, week = base::as.integer(week))

#### Clean Data ####
clean_data <- clean(tt_data)

#### Create Data Visual ####
vis_data <- vis(clean_data)

#### Style Data Visual ####
sty_vis <- sty(vis_data)

#### Save Plot ####
ggsave(
  base::paste0("2023/week_", week , "/plot.png"), 
  width = 30, 
  height = 20, 
  units = "cm",
  dpi = 150)
