#### Week 19 - Childcare Costs ####

#### Workspace setup ####
library(ggplot2)

#### Style Function ####
# A function that takes in
# a data visual and adds 
# style elements. 
#
# @param vis is a data visual.
#
# @return sty is a data visual with style. 
sty <- function(vis){
  sty <- vis +
    scale_x_continuous(
      breaks = seq(2008,2018,2)
    ) 
  return(sty)
}
