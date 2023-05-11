#### Week 19 - Childcare Costs ####

#### Workspace setup ####
# ggplot2: to add text to ggplot visual.
library(ggplot2)
#### Style Add Text Function ####
# A function that takes in a data 
# visual and adds text elements. 
#
# @param vis is a data visual.
# @param title is the title of the data visual.
# @param subtitle is the subtitle of the data visual.
# @param caption is the footnote of the data visual. 
# @param xlab is the x label. 
# @param ylab is the y label.
#
# @return sty is a data visual with text. 
sty_add_text <- function(
    vis,
    # text 
    title,
    subtitle,
    caption, 
    xlab,
    ylab){
  sysfonts::font_add_google(
    font,
    "font")
  sty_add_text <- vis +
    # title
    ggplot2::ggtitle(title) +
    # subtitle and caption
    ggplot2::labs(
      subtitle = subtitle,
      caption = caption) +
    # x and y labs
    ggplot2::xlab(xlab) +
    ggplot2::ylab(ylab) 
  return(sty_add_text)
}

