# data: https://arcticdata.io/catalog/view/doi%3A10.18739%2FA2JH3D41P
# fish creek watershed observatory: http://www.fishcreekwatershed.org/
# lower snowman lake: http://www.fishcreekwatershed.org/lowerSnowman-lake.html
# snowman creek: http://www.fishcreekwatershed.org/snowman-creek.html
# middle snowman lake: http://www.fishcreekwatershed.org/middleSnowman-lake.html

# LOAD LIBRARIES ----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(shinycssloaders)
library(leaflet)

# READ IN DATA ----
lake_data <- read_csv("data/lake_data_processed.csv")
