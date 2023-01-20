# load packages ----
library(shiny)
library(shinyWidgets)
library(palmerpenguins)
library(tidyverse)

# IMPORT FUNCTIONS ----
source("R/penguinSpp_pickerInput.R") # NOTE: with Shiny version 1.5.0, you don't need to source files that are stored in ~/app-dir/R (they are loaded automatically)
#source("R/filterSpp_df.R")