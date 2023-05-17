#### Week 18 - Portal Project ####
# Title: Cleaning Function
# Date: May 17, 2023
# Description: A function that takes
# in a data set and cleans it. 
here::i_am("2023/week_18/functions/clean.R")

#### Load Packages ####
# dplyr: data cleaning functions.
# magrittr: piping function. 
base::library(dplyr)
base::library(magrittr)

#### Cleaning Function ####
# select(): select specific columns.
# filter(): filter by sex, species, and testes. 
# group_by(): group by year and month. 
# reframe(): reframe to include a count.
# n(): count group size.
# unique(): remove duplicate rows.
clean <- function(df){
  clean_df <- df %>%
    dplyr::select(
      month, 
      year, 
      sex, 
      testes, 
      species) %>%
    dplyr::filter(
      sex == "M",
      species == "DM",
      testes == "S") %>%
    dplyr::group_by(
      year, 
      month) %>%
    dplyr::reframe(
      month = month,
      year = year,
      n = dplyr::n()) %>%
    base::unique()
  return(clean_df)
}