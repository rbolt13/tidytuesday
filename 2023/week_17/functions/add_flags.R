#### Workspace setup ####
library(ggplot2)
library("grid")
#### Add Flags ####
# A function that ...
# 
#
#
#
#
add_flags <- function(styled_vis, flags_list){
  for (i in 1:length(flags_list)){
    flag_new <- styled_vis + annotation_custom(
      rasterGrob(flags_list[[i]],
                 width=1, height=1),
      xmin = -2, xmax = -.1,
      ymin = 24.55-i, ymax = 25.45-i)
    styled_vis <- flag_new
  }
  return(flag_new)
}