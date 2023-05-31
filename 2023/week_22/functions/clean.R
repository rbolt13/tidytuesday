#### Week 22 - Verified Oldest People ####
# Title: Cleaning Function
# Date: May 31, 2023
# Description: A function that takes
# in a data set and cleans it. 
here::i_am("2023/week_22/functions/clean.R")

#### Load Packages ####
# magrittr: %>% pipe function. 
# dplyr: data cleaning functions. 
base::library(dplyr)
base::library(magrittr)

#### Cleaning Function ####
clean <- function(df){
  clean_df <- df %>%
    dplyr::mutate(death_month = base::format(death_date, "%m")) %>%
    dplyr::group_by(death_month) %>%
    dplyr::summarise(count = dplyr::n()) %>%
    # highlight jan. 
    mutate(to_highlight = ifelse(death_month == "01", "yes", "no"))
  clean_df$to_highlight[13] <- "no"
  return(clean_df)
}