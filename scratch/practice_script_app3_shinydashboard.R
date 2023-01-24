#..............................SETUP.............................

# load packages
library(tidyverse)
library(leaflet)

# read in data
unique_lakes <- read_csv("shinydashboard/data/lake_data_processed.csv")

#.......................PRACTICE FILTERING.......................

# (will have 3 sliderInputs for the filters below)
filtered_lakes <- unique_lakes |> 
  filter(Elevation >= 8 & Elevation <= 20) |> 
  filter(AvgDepth >= 2 & AvgDepth <= 3) |> 
  filter(AvgTemp >= 4 & AvgTemp <= 6)

#..........................PRACTICE VIZ..........................

leaflet() |> 
  
  # add tiles
  addProviderTiles("Esri.WorldImagery") |> 
  
  # add mini map
  addMiniMap(toggleDisplay = TRUE, minimized = TRUE) |> 
  
  # set view over AK
  setView(lng = -152.048442, lat = 70.249234, zoom = 6) |> 
  
  # add markers
  addMarkers(data =  filtered_lakes,
             lng = filtered_lakes$Longitude, lat = filtered_lakes$Latitude,
             popup = paste("Site Name:", filtered_lakes$Site, "<br>",
                           "Elevation:", filtered_lakes$Elevation, "meters (above SL)", "<br>",
                           "Avg Depth:", filtered_lakes$AvgDepth, "meters", "<br>",
                           "Avg Lake Bed Temperature:", filtered_lakes$AvgTemp, "deg Celsius"))

