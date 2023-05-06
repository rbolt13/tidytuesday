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
vis <- function(df, bar_color){
  vis <- ggplot2::ggplot(
    df,
    ggplot2::aes(
      x = nat_winners,
      # reorder Nationality by nat_winners
      y = stats::reorder(
        Nationality, 
        nat_winners)
    )
  ) +
    ggplot2::geom_bar(
      stat = "identity",
      fill = bar_color
    )
  return(vis)
}