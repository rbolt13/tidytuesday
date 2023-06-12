#### Week 24 - SAFI Data ####
# Title: Cleaning Function
# Date: June 12, 2023
# Description: A function that takes
# in a data set and cleans it. 
here::i_am("2023/week_24/functions/clean.R")

#### Load Packages ####
# magrittr: %>% pipe function. 
# dplyr: data cleaning functions. 
base::library(dplyr)
base::library(magrittr)

#### Cleaning Function ####
clean <- function(df){
  # extract data from list
  extracted_df <- df[[1]]
  clean_df <- extracted_df %>% 
    dplyr::count(rooms, liv_count)
  return(clean_df)
}