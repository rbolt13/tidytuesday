#### Preamble ####
# Purpose: Read in data from csv and make a
# graph of swollen testicles by month and year
# of the AZ Merriam Kangaroo Rat.
# Author: Randi Bolt
# Email: randibolt93@gmail.com
# Date: 2 May 2023
# Prerequisites: -

#### Workspace setup ####
# tidyverse: A collection of data-related packages
base::library(tidyverse) 

#### Read in the data ####
surveys <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-05-02/surveys.csv')

#### Cleaning Function ####
# A function that takes in a df
# and returns a clean df. 
#
# @param data is a df.
# @param clean is a clean df.
#
# Parts: 
# 1. Select
# 2. Filter 
# 3. Group
# 4. Reframe
# 5. Unique 
clean <- function(data){
  clean <- data %>%
    # 1. Select 
    dplyr::select(
      month, 
      year, 
      sex, 
      testes, 
      species) %>%
    # 2. Filter 
    dplyr::filter(
      sex == "M",
      species == "DM",
      testes == "S") %>%
    # 3. Group
    dplyr::group_by(
      year, 
      month) %>%
    # 4. Refremae
    dplyr::reframe(
      month = month,
      year = year,
      n = n()) %>%
    # 5. unique 
    base::unique()
  return(clean)
}

#### Graph Function ####
# A function that takes in a df,
# and outputs a graph.
# 
# @param df is a dataframe with that 
# include month, year, and n. 
# @return vis is a graph. 
#
# Parts:
# 1. Mapping 
# 2. Graph Geometries 
# 3. Facet Wrap
vis <-  function(df){
  vis <- ggplot2::ggplot(
    df, 
    # 1. Mapping
    mapping = ggplot2::aes(
      x = month,
      y = n,
      group = year)
  ) +
    # 2. Graph geoms
    ggplot2::geom_point() +
    ggplot2::geom_line() +
    # 3. Facet Wrap
    ggplot2::facet_wrap(~year)
  return(vis)
}

#### Style Function ####
# A function that inputs a graph, 
# and outputs a stylized graph. 
# 
# @param vis is a graph.
# @return sty is a stylized graph.
# 
# Parts: 
# 1. Title, subtitles, labels, caption, alt text.
# 2. X and Y scale.
# 3. Add values above points.
# 4. Format
sty <- function(vis){
  sty <- vis +
    # 1. Title, subtitles, labels, caption, alt text
    ggplot2::ggtitle("Swollen Testicles of Merriam's Kangaroo Rat by Month and Year near Portal, AZ") +
    ggplot2::labs(
      subtitle = "The Portal Project is a long-term ecological study being conducted near Portal, AZ.\nThis chart shows the number of Merriam's Kangaroo Rat with swollen testicles by month and year over the past 45 years.",
      x = "Month",
      y = "Number of Rodents",
      caption = "Graph by Randi Bolt \n Data from #TidyTuesday and Portal Project",
      alt = "This is a point and line graph showing swollen testicles of Merriam's Kangaroo Rat by months and year over the past 45 years. The x axis shows months, and the y axis shows number of rodents.") +
    
    # 2. x and y scale 
    ggplot2::scale_x_continuous(
      breaks = seq(1,12,1)) + 
    ggplot2::scale_y_continuous(
      breaks = seq(0,60,10)) +
    
    # 3. add values above points
    ggplot2::geom_text(
      ggplot2::aes(
        label = n,
        vjust = -0.2)) +
    
    # 4. format
    ggplot2::theme(
      # title
      plot.title = element_text(
        size = 16,
        face = "bold",
        color = "#232741",
        hjust = .5),
      # subtitle
      plot.subtitle = element_text(
        size = 12,
        hjust = .5,
        color = "#232741"),
      # plot background
      plot.background = element_rect(
        fill = "#C58C60"),
      # graph background
      panel.background = element_rect(
        fill = "#D3DAD9"),
      # x and y axis lables
      axis.title = element_text(
        size = 14, 
        color = "#232741"),
      # legend background
      legend.background = element_rect(
        fill = "#C58C60"),
      # facet graph titles
      strip.background = element_rect(
        fill = "#A76858"))
  return(sty)
}

#### Plot ####
sty(vis(clean(surveys)))

#### Save Plot ####
ggsave(
  "2023/week_18/plot.png", 
  width = 30, 
  height = 20, 
  units = "cm")
