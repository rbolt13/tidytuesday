#### Week 20 - Tornadoes data ####
# Title: Cleaning Function
# Date: May 16, 2023
# Description: A function that takes
# in a data set and cleans it. 

#### Load Packages ####
# 1. tidyr: to remove na rows. 
# 2. magrittr: %>% pipe function. 
# 3. dplyr: data cleaning functions. 
base::library(tidyr)
base::library(dplyr)
base::library(magrittr)

#### Cleaning Function ####
# 1. Drop rows with na value for mag. 
# 2. Summarise tornadoes by month and mag.
# 3. Change mag from double to char value. 
clean <- function(df){
  clean_df <- df %>% 
    tidyr::drop_na(mag) %>%
    dplyr::group_by(mo, mag) %>%
    dplyr::summarise(value = n())
  clean_df$mag <- base::as.character(clean_df$mag)
  base::colnames(clean_df)[2] <- "Magnitude"
  return(clean_df)
}