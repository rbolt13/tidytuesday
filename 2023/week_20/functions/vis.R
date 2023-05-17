#### Week 20 - Tornadoes data ####
# Title: Visual Function
# Date: May 16, 2023
# Description: A function that takes
# in a clean data set and creates a 
# data visual from it. 

#### Load Packages ####
# 1. ggplot2: graphing functions. 
base::library(ggplot2)

#### Visual Function ####
# 1. Make ggplot. 
# 2. Apply bars. 
# 3. Facet wrap. 
vis <- function(clean_df){
  vis <- ggplot2::ggplot(
    clean_df,
    # 1. Make ggplot.
    ggplot2::aes(
      fill = Magnitude,
      x = mo,
      y = value)) +
    # 2. Apply bars.
    ggplot2::geom_bar(
      position = "dodge",
      stat = "identity")  +
    # 3. Facet wrap.
     ggplot2::facet_wrap(~Magnitude)
  return(vis)
}