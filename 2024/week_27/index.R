#### Week 27 - TidyTuesday Data ####

#### Load packages ####
base::library(tidyverse)
base::library(showtext)
base::library(cowplot)
base::library(ggtext)
base::library(camcorder)

#### Load Data ####
tt_datasets <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-07-02/tt_datasets.csv')

### Load Fonts ####
sysfonts::font_add_google("Roboto", "robo")
showtext::showtext_auto()
title_font <- "robo"

#### Load Colors ####
bg_col <- "#333333"
text_col <- "#F0F0F0"

#### Define Text ####
title <- "Quarterly Data Volume for Tidy Tuesday Datasets (2018-2024)"
st <- "This graph shows the total number of cells (rows × columns) for each quarter across different years. 2019 had the largest data sizes with <span style = 'color:yellow;'>**75,152,652 cells**</span> a **6,801%** increase in size from the same quarter of the previous year"
cap <- "**Data**: TidyTuesday <br> **Graphic**: R. Bolt"
xlab <- "Quarter"
ylab <- "Total Cells"

#### Data Wrangling ####
plot_data <- tt_datasets |>
  mutate(size = observations * variables) |>
  group_by(year, week) |>
  summarize(total_size = sum(size), .groups = 'drop') |>
  mutate(quarter = case_when(
    week <= 13 ~ "Q1",
    week <= 26 ~ "Q2",
    week <= 39 ~ "Q3",
    week <= 52 ~ "Q4"
  )) |>
  group_by(year, quarter) |>
  reframe(q_size = sum(total_size))

#### Plot ####
plot <- ggplot2::ggplot(
  plot_data,
  ggplot2::aes(
    x = quarter,
    y = q_size,
    fill = base::factor(quarter)
  )
) +
  ggplot2::geom_col() +
  ggplot2::geom_text(
    ggplot2::aes(
      label = base::formatC(
        q_size, 
        format="d", 
        big.mark=","
      ),
      color = base::factor(quarter)),
    vjust = -1
  ) +
  ggplot2::labs(
    title = title,
    subtitle = st,
    caption = cap,
    x = xlab,
    y = ylab
  ) +
  ggplot2::scale_y_continuous(
    limits = c(0, 110000000),
    breaks = c(20000000,40000000,60000000,80000000),
    labels = scales::comma,) + 
  ggplot2::facet_wrap(
    ~year,
    ncol = 2,
    scales = "free_x") +
  ggplot2::theme_minimal(base_size = 12) +
  ggplot2::theme(
    # Title
    plot.title = element_text(
      colour = text_col,
      size = rel(1.6),
      margin = margin(b = 10, t = 10),
      lineheight = 0.5,
      family = title_font,
      face = "bold",
      hjust = .5
    ), 
    # Subtitle
    plot.subtitle = element_textbox_simple(
      colour = text_col,
      margin = margin(b = 10, t = 0),
      lineheight = 0.5,
      family = title_font,
      hjust = .5
    ),
    # Caption
    plot.caption = element_textbox_simple(
      colour = text_col,
      margin = margin(b = 10, t = 5),
      lineheight = 0.5,
      family = title_font
    ),
    # Axis Titles
    axis.title.y = element_text(
      color = text_col,
      vjust = .5),
    axis.title.x = element_text(color = text_col),
    # Axis Text
    axis.text.x = element_text(
      vjust = 1.5,
      hjust = 1,
      color = text_col),  
    axis.text.y = element_text(color = text_col),
    # Title and Caption Position
    plot.title.position = "plot",
    plot.caption.position = "plot",
    # Background Color
    plot.background = element_rect(
      fill = bg_col, 
      colour = bg_col),
    panel.background = element_rect(
      fill = bg_col, 
      colour = bg_col),
    # Remove Grid lines
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    # Facets
    strip.text = element_text(color = text_col),
    # Legend 
    legend.position = "none"
  ) 

#### Save ####
ggplot2::ggsave(
  filename = "2024/week_27/plot.png", 
  plot = plot, 
  device = "png", 
  width = 3, 
  height = 4, 
  units = "in", 
  dpi = 300)
