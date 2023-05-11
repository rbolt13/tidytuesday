#### Week 19 - Childcare Costs ####

#### Workspace setup ####
library(ggplot2)

#### Visual Function ####
# A function that takes in a df,
# and outputs a data visual.
# 
# @param df is a dataframe.
# @param bar_color is a character value 
# that represents a color for the bars.
# @return vis is a graph. 
vis <- function(clean_df){
  vis <- ggplot2::ggplot(
    clean_df,
    aes(x = study_year,
        y = per_emply,
        group = Gender)
  ) +
    geom_jitter(
      aes(color = Gender)
    ) +
    facet_wrap(~industry)
  return(vis)
}