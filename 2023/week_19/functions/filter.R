#### Week 19 - Childcare Costs ####

#### Workspace setup ####
# dplyr: to clean the data
# magrittr: to pipe the data 
# through cleaning functions.
library(dplyr)
library(magrittr)

#### Filter Function ####
# A function that takes in a df
# and a state abbreviation char value.
# 
# @dependencies dplyr, magrittr
#
# @param join_df is the joined data frame.
# @param state_abb is the state abbreviation.
# 
# return filter_df is a df of filtered data.
filter <- function(
    join_df,
    state_abb){
  filter_df <- join_df %>%
    dplyr::filter(
      state_abbreviation == state_abb
    )
  return(filter_df)
}
