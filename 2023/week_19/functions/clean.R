#### Week 19 - Childcare Costs ####

#### Workspace setup ####
# dplyr: to clean the data
# magrittr: to pipe the data 
# through cleaning functions.
library(dplyr)
library(magrittr)

#### Cleaning Function ####
# A function that takes in a df
# and then: 
# 1. Selects relevant industry rows.
# 2. Make data long. 
# 3. Change industry col to char type. 
# 4. Add gender col.
# 5. Change industry col values. 
# 6. Reorder industry levels. 
# 
# @dependencies dplyr, magrittr
#
# @param filter_df is a df filtered 
# by state.
# 
# @return clean_df is a clean df.
clean <- function(
    filter_df){
  clean_df <- filter_df %>%
    # 1. Select Industry Rows 
    dplyr::select(
      study_year,
      # management, business, science, arts
      memp_m,
      femp_m, 
      # service
      memp_service, 
      femp_service,
      # sales, office
      memp_sales,
      femp_sales,
      # naturla resources, construction, maintenance
      memp_n,
      femp_n,
      # production, transportation, and material
      memp_p,
      femp_p,
      # unemployed
      munr_16,
      funr_16
    ) %>%
    # 2. Make Long Data
    gather(
      industry,
      per_emply,
      memp_m:funr_16,
      factor_key = TRUE
    ) 
  # 3. Make Industry Column a Char Value
  clean_df$industry <- as.character(clean_df$industry)
  # 4. Add Gender Col
  clean_df <- clean_df %>%
    dplyr::mutate(
      Gender = dplyr::case_when(
        base::startsWith(industry, "m") ~ "Male",
        base::startsWith(industry, "f") ~ "Female"
      )) %>%
    # 5. Change industry column values
    dplyr::mutate(
      industry = dplyr::case_when(
        base::endsWith(industry, "emp_m") ~ "Management",
        base::endsWith(industry, "emp_service") ~ "Service",
        base::endsWith(industry, "emp_sales") ~ "Sales",
        base::endsWith(industry, "emp_n") ~ "Construction",
        base::endsWith(industry, "emp_p") ~ "Production",
        base::endsWith(industry, "unr_16") ~ "Unemployed"
        ))
  # 6. Reorganize industry levels
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