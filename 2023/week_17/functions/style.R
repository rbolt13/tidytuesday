#### Workspace setup ####
library(ggplot2)
#### Style Function ####
# A function that takes in
# a data visual and adds 
# style elements. 
#
# @param vis is a data visual.
# @return sty is a data visual with style. 
style <- function(
    vis,
    # text 
    title,
    subtitle,
    caption, 
    xlab,
    ylab,
    # colors
    background_color,
    title_color,
    graph_color){
  sty <- vis +
    # text 
    ggplot2::ggtitle(title) +
    ggplot2::labs(
      subtitle = subtitle,
      caption = caption
    ) +
    ggplot2::xlab(xlab) +
    ggplot2::ylab(ylab) +
    # add value next to bar
    ggplot2::geom_text(
      ggplot2::aes(label = nat_winners,
                   hjust = 1.2)
    ) +
    # themes
    ggplot2::theme(
      # title
      plot.title = element_text(
        size = 18,
        face = "bold",
        color = title_color,
        hjust = .5),
      # caption 
      plot.caption = element_text(
        color = title_color),
      # graph background
      panel.background = element_rect(
        fill = graph_color),
      # x and y axis labels
      axis.title = element_text(
        size = 14, 
        color = title_color),
      # axis ticks text
      axis.text = element_text(
        siz = 10,
        color = title_color),
      # background
      plot.backgroun = ggplot2::element_rect(
        fill = background_color
      )
    )
  return(sty)
}