#### Week 17 - London Marathon ####
# Title: Cleaning Function
# Date: June 18, 2023
# Description: A function that takes in 
# a data set and cleans it. 
here::i_am("2023/week_17/functions/clean.R")

#### Load Packages ####
library(dplyr)
library(magrittr)

#### Cleaning Function ####
clean <- function(data){
  clean_data <- data %>%
    dplyr::group_by(Nationality) %>%
    dplyr::summarise(
      nat_winners = dplyr::n()) %>%
    dplyr::arrange(
      dplyr::desc(nat_winners))
  return(clean_data)
}