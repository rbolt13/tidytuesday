#### Workspace setup ####
library(dplyr)
library(magrittr)
#### Cleaning Function ####
# A function that takes in a df
# and returns a clean df. 
# 
# @dependencies dplyr, magrittr
#
# @param data is a df.
# @param clean is a clean df.
clean <- function(data){
  clean_data <- data %>%
    dplyr::group_by(Nationality) %>%
    dplyr::summarise(
      nat_winners = dplyr::n()) %>%
    dplyr::arrange(
      dplyr::desc(nat_winners))
  return(clean_data)
}