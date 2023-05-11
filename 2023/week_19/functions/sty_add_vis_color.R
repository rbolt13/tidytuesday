#### Week 19 - Childcare Costs ####

#### Workspace setup ####
library(ggplot2)
#### Style Add Visual Color Function ####
# A function that takes in a data 
# visual and adds color.
#
# @param vis is a data visual.
# @param value_color is the color of the 
# points / values on the visual. 
# @param plot_color is the color of the 
# plot. 
# @param graph_color is the color of the 
# whole visual.
# @param legend_color is the color of the legend.
# @param facet_color is the color of the 
# facet border. 
#
# @return sty is a data visual with color. 
sty_add_vis_color <- function(
    vis,
    # colors
    value_colors,
    plot_color,
    graph_color,
    legend_color,
    facet_color){
  sty <- vis +
    # value colors
    ggplot2::scale_color_manual(
      values = value_colors
    ) + 
    # plot colors 
    ggplot2::theme(
      # plot background
      plot.background = element_rect(
        fill = plot_color
      ),
      # graph background color
      panel.background = element_rect(
        fill = graph_color
      ),
      # legend background color
      legend.background = element_rect(
        fill = legend_color
      ),
      # facet header background color
      strip.background = element_rect(
        fill = facet_color
      )
    )
  return(sty)
}