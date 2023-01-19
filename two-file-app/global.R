# LOAD LIBRARIES ----
library(shiny)
library(lterdatasampler)
library(palmerpenguins)
library(tidyverse)
library(shinyWidgets)
library(markdown)
library(shinycssloaders)
library(sass)

# COMPILE CSS ----
sass(
  input = sass_file("R/my_sass_styles.scss"),
  output = "www/my_sass_styles.css"
)

# DATA WRANGLING ----

# trout data
clean_trout <- and_vertebrates |>
  filter(species == "Cutthroat trout") |>
  select(sampledate, section, species, length_mm = length_1_mm, weight_g, channel_type = unittype) |> 
  mutate(channel_type = case_when(
    channel_type == "C" ~ "cascade",
    channel_type == "I" ~ "riffle",
    channel_type =="IP" ~ "isolated pool",
    channel_type =="P" ~ "pool",
    channel_type =="R" ~ "rapid",
    channel_type =="S" ~ "step (small falls)",
    channel_type =="SC" ~ "side channel"
  )) |> 
  mutate(section = case_when(
    section == "CC" ~ "clear cut forest",
    section == "OG" ~ "old growth forest"
  )) |> 
  drop_na()

# GGPLOT THEME ----
myCustomTheme <- theme_light() +
  theme(axis.text = element_text(color = "black", size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    legend.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 13),
    legend.position = "bottom",
    panel.border = element_rect(colour = "black", fill = NA, linewidth = 0.7))