#### Week 19 - Childcare Costs ####

#### Workplace Setup ####
# tidyverse: A collection of data-related packages
base::library(tidyverse)
# functions
base::source("2023/week_19/functions/join.R")
base::source("2023/week_19/functions/filter.R")
base::source("2023/week_19/functions/clean.R")
base::source("2023/week_19/functions/vis.R")
base::source("2023/week_19/functions/sty_add_text.R")
base::source("2023/week_19/functions/sty_add_text_color.R")
base::source("2023/week_19/functions/sty_add_vis_color.R")
base::source("2023/week_19/functions/sty_add_font.R")
base::source("2023/week_19/functions/sty_text_size.R")
base::source("2023/week_19/functions/sty.R")

#### Variables ####
# Change State
state_abb <- "OR"
# text
title = "Employment and Unemployment Trends in Oregon"
subtitle = "Shown by industry and gender between 2008 and 2018."
caption = "Graph by Randi Bolt\nData from #TidyTuesday and The National Database of Childcare Prices (NDCP), the most comprehensive federal source of childcare prices at the county level."
xlab = "Year"
ylab = "Percent"
# text colors
title_color = "#ABB3B8"
subtitle_color = "#ABB3B8"
caption_color = "#ABB3B8"
axis_title_color = "#ABB3B8"
axis_text_color = "#ABB3B8"
legend_title_color = "#ABB3B8"
legend_text_color = "#ABB3B8"
# layout colors
value_colors = c("#398f89", "#6c4e97")
plot_color = "#303A2B"
graph_color = "#D8D8F6"
legend_color = plot_color
facet_color = "#ABB3B8"
# font (https://fonts.google.com/)
font = "Roboto Condensed"
# text sizes
large_text = 80
medium_text = 40
small_text = 20

title_text_size = large_text
subtitle_text_size = medium_text
caption_text_size = small_text
axis_title_text_size = medium_text
axis_labels_text_size = small_text
legend_title_text_size = medium_text
legend_labels_text_size = small_text
facet_text_size = medium_text

#### Read in the data ###
childcare_costs <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-05-09/childcare_costs.csv')
counties <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-05-09/counties.csv')

#### Join the data ####
join_data <- join(
  childcare_costs, 
  counties)

#### Filter the data ####
filter_data <- filter(
  join_data,
  state_abb)

#### clean the data #### 
clean_data <- clean(filter_data)

#### Create Data Visual ####
vis_data <- vis(clean_data)

#### Add Text to Visual ####
sty_with_text <- sty_add_text(
  vis_data,
  title,
  subtitle,
  caption,
  xlab,
  ylab)

#### Add Colors to Text ####
sty_text_with_color <- sty_add_text_color(
  sty_with_text,
  title_color,
  subtitle_color,
  caption_color,
  axis_title_color,
  axis_text_color,
  legend_title_color,
  legend_text_color)

#### Add Colors to Visual ####
sty_vis_with_color <- sty_add_vis_color(
  sty_text_with_color,
  value_colors,
  plot_color,
  graph_color,
  legend_color,
  facet_color)

#### Add Font to Visual ####
sty_vis_with_font <- sty_add_font(
  sty_vis_with_color,
  font)

#### Adjust Text Size #### 
sty_vis_text_size <- sty_text_size(
  sty_vis_with_font,
  title_text_size,
  subtitle_text_size,
  caption_text_size,
  axis_title_text_size,
  axis_labels_text_size,
  legend_title_text_size,
  legend_labels_text_size,
  facet_text_size)

#### Stylize Visual ####
sty_vis <- sty(sty_vis_text_size)

#### Save Plot ####
ggsave(
  "week_19/plot.png", 
  width = 30, 
  height = 20, 
  units = "cm")