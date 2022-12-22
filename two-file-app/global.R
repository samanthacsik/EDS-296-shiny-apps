# LOAD LIBRARIES ----
library(shiny)
library(lterdatasampler)
library(tidyverse)

# GGPLOT THEME ----
myCustomTheme <- theme_light() +
  theme(#text = element_text(family = "mono"), 
    axis.text = element_text(color = "black", size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    legend.title = element_text(size = 14, face = "italic"),
    legend.text = element_text(size = 13),
    panel.border = element_rect(colour = "black", fill = NA, linewidth = 0.7))