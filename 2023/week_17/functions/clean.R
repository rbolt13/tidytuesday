#### Week 17 - London Marathon ####
# Title: Cleaning Function
# Date: May 18, 2023
# Description: A function that takes in 
# a data set and cleans it. 
here::i_am("2023/week_17/functions/clean.R")

#### Load Packages ####
# dplyr: data cleaning functions.
# magrittr: %>% pipe functions. 
library(dplyr)
library(magrittr)

#### Cleaning Function ####
# group_by(): group data by nationality.
# summarise(): summarise data.
# n(): count group.
# arrange(): arrange data.
# desc(): arragen in desc order.
clean <- function(data){
  clean_data <- data %>%
    dplyr::group_by(Nationality) %>%
    dplyr::summarise(
      nat_winners = dplyr::n()) %>%
    dplyr::arrange(
      dplyr::desc(nat_winners))
  return(clean_data)
}