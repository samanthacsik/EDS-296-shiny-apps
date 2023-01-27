# LOAD LIBRARIES ----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(shinycssloaders)
library(leaflet)
library(markdown)

# READ IN DATA ----
lake_data <- read_csv("data/lake_data_processed.csv")
