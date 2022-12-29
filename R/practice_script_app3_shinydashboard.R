##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##------------------------------ DATA WRANGLING---------------------------------
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# load packages ----
library(tidyverse)
library(leaflet)

# read in data ----
lake_monitoring_data <- read_csv(here::here("raw_data/FCWO_lakemonitoringdata_2011_2022_daily.csv"))

# NOTE: dropping NAs/missing values and calculating average from remaining observations
# THIS IS NOT GOOD DATA SCIENCE PRACTICE AND IS FOR DEMONTRATION PURPOSES ONLY

# calculate avg depth & temp ----
avg_depth_temp <- lake_monitoring_data |> 
  select(Site, Depth, BedTemperature) |> 
  filter(Depth != "NaN") |> 
  drop_na(BedTemperature) |> 
  group_by(Site) |> 
  summarize(
    AvgDepth = round(mean(Depth), 1),
    AvgTemp = round(mean(BedTemperature), 1)
  )

# join avg depth & temp to original data ---
lake_monitoring_data <- full_join(lake_monitoring_data, avg_depth_temp)

# unique lakes for mapping ----
unique_lakes <- lake_monitoring_data |> 
  select(Site, Latitude, Longitude, Elevation, AvgDepth, AvgTemp) |> 
  distinct()

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##------------------------------- PRACTICE VIZ----------------------------------
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# practice filtering data (will have 3 sliderInputs for the filters below)
filtered_lakes <- unique_lakes |> 
  filter(Elevation >= 8 & Elevation <= 20) |> 
  filter(AvgDepth >= 2 & AvgDepth <= 3) |> 
  filter(AvgTemp >= 4 & AvgTemp <= 6)

# map it ----
map <- leaflet() |> 
  
  # add tiles
  addProviderTiles("Esri.WorldImagery", # make note of using appropriate tiles
                   options = providerTileOptions(maxNativeZoom = 19, maxZoom = 100)) |> 
  
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

map
