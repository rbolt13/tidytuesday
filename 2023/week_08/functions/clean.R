#### Week 8 - Bob Ross ####
# Title: Cleaning Function
# Date: May 17, 2023
# Description: A function that takes
# in a data set and cleans it. 
here::i_am("2023/week_08/functions/clean.R")

#### Load Packages ####
# dplyr: data cleaning functions
base::library(dplyr)

#### Cleaning Function ####
# 1. Group by season.
# 2. Summarise number of colors by season.
clean <- function(df){
  clean_df <- df %>%
    dplyr::group_by(season) %>%
    dplyr::summarise(total_num_colors = sum(num_colors))
  return(clean_df)
}