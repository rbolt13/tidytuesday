#### Week 19 - Childcare Costs ####

#### Workspace setup ####
# ggplot2: to add text to ggplot visual.
library(ggplot2)

#### Style Text Size Function ####
# A function that takes in a data 
# visual and adjusts the text size
#
# @param vis is a data visual.
# @param title_text_size is the size of the 
# title text.
# @param subtitle_text_size is the size of 
# the subtitle.
# @param caption_text_size is the size of 
# the footnote.
# @param axis_title_text_size is the size of 
# the x and y axis labels.
# @param axis_legend_text_size is the size of 
# the axis ticks and text size. 
# @param legend_title_text_size is the size of 
# the legend header text.
# @param legend_labels_text_size is the size of 
# the legend labels text.
# @param facet_text_size is the size of the 
# facet label text.
#
# @return sty_text_size_vis is a visual with 
# sized text. 
sty_text_size <- function(
    vis, 
    title_text_size,
    subtitle_text_size,
    caption_text_size,
    axis_title_text_size,
    axis_labels_text_size,
    legend_title_text_size,
    legend_labels_text_size,
    facet_text_size){
  # sty text size
  sty_text_size_vis <- vis +
    ggplot2::theme(
      # title
      plot.title = ggplot2::element_text(
        size = title_text_size),
      # subtitle
      plot.subtitle = ggplot2::element_text(
        size = subtitle_text_size),
      # caption
      plot.caption = ggplot2::element_text(
        size = caption_text_size),
      # axis titles
      axis.title = ggplot2::element_text(
        size = axis_title_text_size),
      # axis labels
      axis.text = ggplot2::element_text(
        size = axis_labels_text_size),
      # legend title
      legend.title = ggplot2::element_text(
        size = legend_title_text_size),
      # legend text 
      legend.text = ggplot2::element_text(
        size = legend_labels_text_size),
      strip.text = ggplot2::element_text(
        size = facet_text_size)
    ) 
  return(sty_text_size_vis)
}
