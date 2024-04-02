#### Week 13 - NCAA Men's March Madness ####
# Title: Index
# Date: April 2, 2024
# Description: This file goes through set-up,
# cleaning, graphing, and saving a png file. 

#### Packages ####
# tidyverse: A collection of data-related packages.
# googlesheets4: Read data from a google sheet URL. 
# forcats: Working with Categorical Variables (Factors)
# showtext: Use various fonts. 
# ggtext: Use markdown in subtitle. 
base::library(tidyverse)
base::library(googlesheets4)
base::library(forcats)
base::library(showtext)
base::library(ggtext)

#### Data ####
# public_picks: TidyTuesday Data of public picks. 
# team_results: My data set of team results for 2024.
public_picks <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-03-26/public-picks.csv')
team_results <- googlesheets4::read_sheet(
  "https://docs.google.com/spreadsheets/d/1rxHKeP0RVZZ2ujjqRPq3AhK6R8a4aI7LMRyli543gTs/edit#gid=0",
  sheet = "2024",
  na="TBD"
)

#### Fonts ####
# font_add_google(): Search Google Fonts. 
# showtext_auto(): Turn showtext on for graphics. 
sysfonts::font_add_google("Merriweather", "font")
showtext::showtext_auto()

#### Colors ####
# col1: Text 
# col2: Background
col1 <- "#002A5C"
col2 <- "#e0a761"

### Text ####
# title_text
# subtitle_text
# caption_text
# xlab_text
# ylab_text
# fill_text
title_text <- "Team Performance vs. Public Expectation"
subtitle_text <- "March Madness is a knockout college basketball tournament with 68 teams <br>battling in six rounds for the title. This chart, covering men's teams for <br> 2024, shows when teams didn't meet or beat fan expectations. <span style='color:red;'>Red </span> means <br>a team did <span style='color:red;'>better than expected</span>, <span style='color:blue;'>blue means worse</span>, and gray indicates <br>that the data isn't currently available. The values represent the percentage <br>point difference between actual wins and public forecasts."
caption_text <- "Randi Bolt \nMarch 2024 \n#TidyTuesday \nNCAA March Madness"
xlab_text <- "NCAA Tournament Rounds"
ylab_text <- "Team (Seed)"
fill_text <- "Difference"

### Clean Data
# 1. Create win columns for each round. 
# 2. Convert char percentage columns into doubles.
# 3. Join team_results and public picks by TEAM.
# 4. Calculate the difference b/t team results and public picks.
# 5. Pivot heatmap data longer so that rounds are in one column.
# 6. Rename rounds to extend names for labels.
# 7. Re-assign factor levels for rounds column.

# 1. Creates new columns that will have a 1 value if the team made it to that round at least once, otherwise it will be 0.
team_results <- team_results |>
  mutate(R64WIN = ifelse(R64 > 0, 1, 0),
         R32WIN = ifelse(R32 > 0, 1, 0),
         S16WIN = ifelse(S16 > 0, 1, 0),
         E8WIN = ifelse(E8 > 0, 1, 0),
         F4WIN = ifelse(F4 > 0, 1, 0),
         F2WIN = ifelse(F2 > 0, 1, 0),
         CHAMPWIN = ifelse(CHAMP > 0, 1, 0))

# 2. Convert character percentage columns into doubles.
public_picks <- public_picks |>
  dplyr::filter(YEAR == 2024) |>
  dplyr::mutate(
    across(
      R64:FINALS, 
      ~readr::parse_number(as.character(.))
    )
  )

# 3. Join team_results and public picks by TEAM
data_for_heatmap <- team_results |>
  inner_join(public_picks, by = "TEAM") |>
  # 4. Calculate the difference b/t team results and public picks.
  mutate(TEAM_SEED = paste(TEAM, " (", SEED, ")", sep = ""),
         DIFF_R64 = R64WIN * 100 - R64.y,
         DIFF_R32 = R32WIN * 100 - R32.y,
         DIFF_S16 = S16WIN * 100 - S16.y,
         DIFF_E8 = E8WIN * 100 - E8.y,
         DIFF_F4 = F4WIN * 100 - F4.y,
         DIFF_FINALS = F2WIN * 100 - FINALS)

# 5. Pivot heatmap data longer so that rounds are in one column.
data_for_heatmap_long <- data_for_heatmap |>
  select(TEAM_SEED, REGION, DIFF_R64, DIFF_R32, 
         DIFF_S16, DIFF_E8, DIFF_F4, DIFF_FINALS) |>
  pivot_longer(cols = starts_with("DIFF"), 
               names_to = "ROUND", 
               values_to = "DIFFERENCE") |>
  mutate(ROUND = sub("DIFF_", "", ROUND)) 

# 6. Rename rounds to extend names for labels.
data_for_heatmap_long$ROUND <- 
  factor(
    data_for_heatmap_long$ROUND,
    levels = c("R64", "R32", "S16", 
               "E8", "F4", "FINALS"),
    labels = c("Round of 64", "Round of 32", 
               "Sweet 16", "Elite 8", 
               "Final Four", "Finals")
  )

# 7. Re-assign factor levels for rounds column.
data_for_heatmap_long$ROUND <- fct_relevel(
  data_for_heatmap_long$ROUND, 
  "Round of 64", "Round of 32",
  "Sweet 16", "Elite 8",
  "Final Four", "Finals")

#### Heatmap ####
# Data: data_for_heatmap_long
# Aesthetics: x = Round, y = Team (Seed), fill = difference
# Graph Colors: low = blue, high = red, midpoint = 0
# Labels: defined under Set-Up > Text. 
# Add Values: If the difference is NA define as TBD, else
# round the difference to 2 decimals and add a % sign. 
# Facet Wrap: by region. 
# Apply minimal theme. 
# Theme: title, subtitle, caption, axis titles, axis text,
# background colors, and legend position. 

# heatmap
heatmap <- ggplot2::ggplot(
  # Data
  data_for_heatmap_long, 
  # Aesthetics
  aes(x = ROUND, 
      y = TEAM_SEED, 
      fill = DIFFERENCE)
) +
  geom_tile() + 
  # Graph Colors
  ggplot2::scale_fill_gradient2(
    low = "blue", 
    high = "red", 
    midpoint = 0
  ) +
  # Labels
  ggplot2::labs(
    title = title_text,
    subtitle = subtitle_text,
    caption = caption_text,
    x = xlab_text,
    y = ylab_text,
    fill = fill_text
  ) +
  # Percentage Point Difference Values
  ggplot2::geom_text(
    ggplot2::aes(
      label = ifelse(
        is.na(DIFFERENCE), "TBD",
        paste0(round(DIFFERENCE, 
                     digits = 2),"%")
      ),
      hjust = 0
    )
  ) +
  # Facet Wrap
  facet_wrap(~ REGION, ncol = 1, scales = "free_y") +
  # Apply minimal theme
  ggplot2::theme_minimal() +
  # Theme
  ggplot2::theme(
    # Title
    plot.title = element_text(
      size = 30,
      family = "font",
      face = "bold",
      hjust = 0,
      color = col1),
    # Subtitle
    plot.subtitle = element_markdown(
      size = 16,
      family = "font",
      hjust = 0,
      color = col1),
    # Caption
    plot.caption = element_text(
      size = 12,
      family = "font",
      hjust = 1,
      color = col1),
    # Axis Titles
    axis.title = element_text(
      size = 24,
      family = "font",
      color = col1),
    # X Axis Title
    axis.title.x = element_text(vjust = -1.5),
    # Axis Text
    axis.text = element_text(
      size = 12,
      family = "font",
      color = col1),
    # Background colors
    plot.background = element_rect(fill = col2),
    # Adjust Axis text
    axis.text.x = element_text(vjust = -1),
    # Position Legend
    legend.position = "bottom") 

#### Save #### 
ggsave(
  "2024/week_13/plot.png", 
  width = 35, 
  height = 45, 
  units = "cm",
  dpi = 85)
