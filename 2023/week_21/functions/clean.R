#### Week 21 - Squirrel Census ####
# Title: Cleaning Function
# Date: May 22, 2023
# Description: A function that takes
# in a data set and cleans it. 
here::i_am("2023/week_21/functions/clean.R")

#### Load Packages ####
# magrittr: %>% pipe function. 
# dplyr: data cleaning functions. 
base::library(dplyr)
base::library(magrittr)

#### Cleaning Function ####
# group_by(): group the data.
# summarise(): summarise the data.
# n(): count group size. 
# colnames(): rename the columns.
# is.na(): change na values.
clean <- function(df){
  clean_df <- df %>%
    dplyr::group_by(`Primary Fur Color`, `Highlight Fur Color`) %>%
    dplyr::summarise(value = dplyr::n())
  base::colnames(clean_df)[1] = "Group"
  base::colnames(clean_df)[2] = "subgroup"
  clean_df[base::is.na(clean_df)] <- "Not Available"
  return(clean_df)
}