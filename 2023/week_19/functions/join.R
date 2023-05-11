#### Week 19 - Childcare Costs ####

#### Workspace setup ####
# dplyr: to clean the data
# magrittr: to pipe the data 
# through cleaning functions.
library(dplyr)
library(magrittr)

#### Joining Function ####
# A function that takes in a two
# df and joins them by a char value.
# 
# @dependencies dplyr, magrittr
#
# @param df1 is a df.
# @param df2 is a df.
# @param value is a char value to joint
# the two df. 
# 
# return join_df is a df of joined data
join <- function(
    df1,
    df2){
  join_df <- df1 %>%
    dplyr::left_join(
      df2,
      by = c("county_fips_code" = "county_fips_code")
    )
  return(join_df)
}
