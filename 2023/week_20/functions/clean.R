#### Week 20 - Tornadoes data ####
# Title: Cleaning Function
# Date: May 16, 2023
# Description: A function that takes
# in a data set and cleans it. 
here::i_am("2023/week_20/functions/clean.R")

#### Load Packages ####
# tidyr: to remove na rows. 
# magrittr: %>% pipe function. 
# dplyr: data cleaning functions. 
base::library(tidyr)
base::library(dplyr)
base::library(magrittr)

#### Cleaning Function ####
# drop_na(): drop rows with missing 
# value for magnitude.
# group_by(): group by month and mag. 
# summarise(): summarise data.
# n(): count group. 
# as.character(): change to char value.
# colnames(): change column name. 
clean <- function(df){
  clean_df <- df %>% 
    tidyr::drop_na(mag) %>%
    dplyr::group_by(mo, mag) %>%
    dplyr::summarise(value = n())
  clean_df$mag <- base::as.character(clean_df$mag)
  base::colnames(clean_df)[2] <- "Magnitude"
  return(clean_df)
}