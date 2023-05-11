#### Week 19 - Childcare Costs ####

#### Workspace setup ####
library(ggplot2)
#### Style Add Text Color Function ####
# A function that takes in a data 
# visual with text and colors the text.
#
# @param vis is a data visual with text on it.
# @param title_color is the color of the title.
# @param subtitle_color is the color of the subtitle.
# @param caption_color is the color of the caption.
# @param axis_title_color is the color of axis titles.
# @param axis_text_color is the color of axis text and tick marks.
# @param legend_title_color is the color of the legend title.
# @param legend_text_color is the color of the legend text.
#
# @return sty is a data visual with colored text. 
sty_add_text_color <- function(
    vis,
    # colors
    title_color,
    subtitle_color,
    caption_color,
    axis_title_color,
    axis_text_color,
    legend_title_color,
    legend_text_color){
  sty <- vis +
    ggplot2::theme(
      # title
      plot.title = element_text(
        color = title_color,
        hjust = .5),
      # subtitle
      plot.subtitle = element_text(
        color = subtitle_color,
        hjust = 0.5),
      # caption
      plot.caption = element_text(
        color = caption_color),
      # axis title
      axis.title = element_text(
        color = axis_title_color
      ),
      # axis text
      axis.text = element_text(
        color = axis_text_color
      ),
      # legend title
      legend.title = element_text(
        color = legend_title_color
      ),
      # legend text 
      legend.text = element_text(
        color = legend_text_color
      )
    )
  return(sty)
}