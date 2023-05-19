#### Week 19 - Childcare Costs ####
# Title: Cleaning Function
# Date: May 18, 2023
# Description: A function that takes 
# in a data set and cleans it. 
here::i_am("2023/week_19/functions/clean.R")

#### Load Packages ####
# dplyr: data cleaning functions.
# magrittr: %>% pipe function. 
# tidyr: data tidying functions. 
base::library(dplyr)
base::library(magrittr)
base::library(tidyr)

#### Load State Abbreviation #### 
state_abb <- "OR"

#### Cleaning Function ####
# left_join(): joins columns. 
# filter(): filter by state. 
# select(): select specific columns. 
# gather(): pivot longer. 
# as.character(): change to char value. 
# mutate(): add gender column and adjust 
# industry column. 
# case.when(): if_else statements. 
# startsWith(): if entry starts with given string.
# endsWith(): if entry ends with given string. 
# factor(): reorder industry levels. 
clean <- function(df1, df2){
  clean_df <- df1 %>%
    dplyr::left_join(df2,
      by = c("county_fips_code" = "county_fips_code")
      ) %>%
    dplyr::filter(state_abbreviation == state_abb) %>%
    dplyr::select(
      study_year,
      # management, business, science, arts
      memp_m, femp_m, 
      # service
      memp_service, femp_service,
      # sales, office
      memp_sales, femp_sales,
      # natural resources, construction, maintenance
      memp_n, femp_n,
      # production, transportation, and material
      memp_p, femp_p,
      # unemployed
      munr_16, funr_16
    ) %>%
    tidyr::gather(
      industry,
      per_emply,
      memp_m:funr_16,
      factor_key = TRUE
    ) 

  clean_df$industry <- as.character(clean_df$industry)
  
  clean_df <- clean_df %>%
    dplyr::mutate(
      Gender = dplyr::case_when(
        base::startsWith(industry, "m") ~ "Male",
        base::startsWith(industry, "f") ~ "Female"
      )) %>%
    dplyr::mutate(
      industry = dplyr::case_when(
        base::endsWith(industry, "emp_m") ~ "Management",
        base::endsWith(industry, "emp_service") ~ "Service",
        base::endsWith(industry, "emp_sales") ~ "Sales",
        base::endsWith(industry, "emp_n") ~ "Construction",
        base::endsWith(industry, "emp_p") ~ "Production",
        base::endsWith(industry, "unr_16") ~ "Unemployed"
        ))

  clean_df$industry <- base::factor(
    clean_df$industry,
    levels = c(
      "Management", 
      "Sales",
      "Service",
      "Construction",
      "Production",
      "Unemployed"
    ))
  return(clean_df)
}