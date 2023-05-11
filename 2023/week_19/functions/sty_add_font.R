#### Week 19 - Childcare Costs ####

#### Workspace setup ####
# ggplot2: to add text to ggplot visual.
# showtext: to define font. 
library(ggplot2)
library(showtext)

#### Style Add Font Function ####
# A function that takes in a data 
# visual and adds font.. 
#
# @param vis is a data visual.
# @param font is the name of the font
# used in the visual
#
# @return sty_font_vis is a visual with font. 
sty_add_font <- function(vis, font){
  # load google fonts
  font_add_google(font, "gfont")
  showtext_auto()
  # sty fonts
  sty_font_vis <- vis +
    theme(
      # title
      plot.title = element_text(family = "gfont"),
      # subtitle
      plot.subtitle = element_text(family = "gfont"),
      # caption
      plot.caption = element_text(family = "gfont"),
      # axis titles
      axis.title = element_text(family = "gfont"),
      # axis labels
      axis.text = element_text(family = "gfont"),
      # legend title
      legend.title = element_text(family = "gfont"),
      # legend text 
      legend.text = element_text(family = "gfont"),
      # facet label 
      strip.text = element_text(family = "gfont")
    ) 
  return(sty_font_vis)
}