#### Week 25 - UFO Sightings Redux ####
# Title: Cleaning Function
# Date: June 22, 2023
# Description: A function that takes
# in a data set and cleans it. 
here::i_am("2023/week_25/functions/clean.R")

#### Load Packages ####
# magrittr: %>% pipe function. 
# dplyr: data cleaning functions.
# tidyr: data manipulation functions.
base::library(dplyr)
base::library(magrittr)
base::library(tidyr)

#### Cleaning Function ####
clean <- function(df){
  # Filter date for Oregon
  or_df <- df %>%
    dplyr::filter(state == c("OR")) %>%
    dplyr::reframe(
      shape = shape, 
      duration_seconds = duration_seconds,
      duration_minutes = duration_seconds/60)
  # remove nas 
  or_df$duration_seconds <- na.omit(or_df$duration_seconds)
  # Subset for all data 5 minutes or less
  clean_df <- 
    base::subset(or_df, 
                 duration_seconds < 301) %>%
    tidyr::replace_na(list(shape = c("not available")))
    
  return(clean_df)
}