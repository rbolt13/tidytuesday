#### Week 14 - Du Bois Visualization Challenge
# Title: Index
# Date: April 9, 2024
# Description: This file goes through set-up,
# cleaning, graphing, and saving a .png file. 

#### Packages ####
# tidyverse: A collection of data-related packages.
# showtext: Use various fonts. 
# forcats: Add factors to categorical variables. 
# ggtext: Used markdown on graph text. 
# ggrepel: Overlapping labels on graph. 
base::library(tidyverse)
base::library(showtext)
base::library(forcats)
base::library(ggtext)
base::library(ggrepel)

#### Data ####
# dubois: TidyTuesday data of occupation percentages
dubois <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-04-02/dubois_week10.csv')

#### Fonts ####
# font_add_google(): Search Google Fonts. 
# showtext_auto(): Turn showtext on for graphics. 
sysfonts::font_add_google("Courier Prime", "font")
showtext::showtext_auto()

#### Colors ####
# col1: Text 
# col2: Background
# colors: Colors for Pie Chart
col1 <- "green"
col2 <- "black"
colors <- c("#ce1d40", "#a59faa", "#e4bdb0", "#d1bea6", "#9b8f7d", "#ecb95b")

#### Text ####
# title_text
# subtitle_text
# caption_text
title_text <- "A SERIES OF STATISTICAL CHARTS. ILLUSTRA-<br>TING THE CONDITION OF THE DESCENDANTS OF FOR-<br>MER AFRICAN SLAVES NOW RESIDENT IN THE UNITED<br>STATES OF AMERICA."
subtitle_text <- "<br> <span style='color:red;'>UNE SÉRIE DE CARTES ET DIAGRAMMES STATISTIQUES MONTRANT LA<br>CONDITION PRÉSENTE DES DESCENDANTS DES ANCIENS ESCLAVES AFRI-<br>CANS ACTUELLMENT ÉTABLIS DANS LES ETATS UNIS D´ AMÉRIQUE.</span> <br> <br> THE UNIVERSITY WAS FOUNDED IN 1867. <br> IT HAS INSTRUCED 6000 NEGROS STUDENTS. <br> <br> <span style='color:red;'>L´UNIVERSITÉ A ÉTÉ FONDÉE EN 1867. <br> ELLE A DONNÉ L´ INSTRUCTION A'6000 ÉTUDIANTS NEGRES.</span><br> <br> IT HAS GRADUATED 330 NEGROES AMOUNG WHOM ARE: <br> <br> <span style='color:red;'> ELLE A DÉLIVRÉ DES DIPLOMES A 330 NÉGRES DONT:</span>"
caption_text <- "Randi Bolt \nApril 2024 \n#TidyTuesday \nDu Bois"

#### Clean Data ####
# Add Columns
# 1. Calculate the cumulative sum of 'Percentage' column in reverse order.
# 2. Calculate the position for labels. 
# 3. Replace NA values in 'pos' with half of the 'Percentage' value.
dubois <- dubois |>
  dplyr::mutate(
    # Calculate the cumulative sum of 'Percentage' column in reverse order.
    csum = base::rev(base::cumsum(base::rev(Percentage))),
    # Calculate the position for labels.
    pos = Percentage/2 + dplyr::lead(csum, 1),
    # Replace NA values in 'pos' with half of the 'Percentage' value.
    pos = dplyr::if_else(base::is.na(pos), Percentage/2, pos))

#### Pie Chart ####
# Data: dubois (modified with position column)
# Aesthetics: x = blank, y = Percentage, fill = fct_inorder(Occupation)
# Geometry: width = 1
# Polarize Coordinate: theta = y, start = 1.5, directional = 1 (clockwise)
# Define fill color and order
# Add labels outside of pie chart. 
# Legend title
# Define labels
# Remove Grid from Pie Chart
# Theme: title, subtitle, caption, legend, background, plot margins
pie <- ggplot2::ggplot(
  # Data
  dubois, 
  # Aesthetics
  aes(
    x = "" , 
    y = Percentage, 
    fill = fct_inorder(Occupation))
) +
  # Geometry
  geom_col(
    width = 1) +
  # Polarize Coordinates
  coord_polar(
    theta = "y", 
    start = 1.5, 
    direction = 1) +
  # Define fill color and order
  scale_fill_manual(
    values = colors,
    breaks = c(
      "Teachers", "Ministers", "Government Service", 
      "Business", "Other Professions", "House Wives"
    )
  ) +
  # Add Labels Outside Pie Chart 
  ggrepel::geom_label_repel(
    # Data
    data = dubois,
    # Aesthetics
    aes(
      y = pos, 
      label = paste0(Percentage, "%")
    ),
    size = 4.5, 
    nudge_x = 1, 
    show.legend = FALSE,
    colour = "black"
  ) +
  # Legend Title
  guides(
    fill = guide_legend(title = "")
  ) +
  # Labels
  labs(
    title = title_text,
    subtitle = subtitle_text,
    caption = caption_text
  ) +
  # Remove Grid from Pie Chart
  theme_void(
  ) +
  # Theme
  theme(
    # Title
    plot.title = element_markdown(
      size = 11, 
      hjust = 0.5,
      lineheight = 0.9,
      family = "font",
      face = "bold",
      color = col1),
    plot.title.position = "plot",
    # Subtitle
    plot.subtitle = element_markdown(
      size = 9, 
      hjust = 0.5,
      lineheight = 0.9,
      family = "font", 
      color = col1
    ),
    # Caption
    plot.caption = element_text(
      size = 6,
      family = "font",
      color = col1,
      hjust = 1
    ),
    # Legend
    legend.position = "left",
    legend.title = element_blank(),
    legend.text = element_text(
      size = 8,
      family = "font",
      color = col1),
    legend.key = element_blank(),
    legend.background = element_blank(),
    # Background
    plot.background = element_rect(fill = col2, color = NA),
    # Plot Margins
    plot.margin = margin(t = 20, r = 20, b = 20, l = 20))

#### Save ####
ggplot2::ggsave(
  "2024/week_14/plot.png", 
  width = 5.25, 
  height = 6, 
  units = "in",
  dpi = 100)