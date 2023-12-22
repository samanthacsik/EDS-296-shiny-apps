#...............................................................................
#                                                                              .
#  For simplicity, I've removed all rows with missing values (i.e. `NaN`s      .
#  in the `Depth` column & `NA`s in the `BedTemperature` column) before        .
#  calculating averages. However, exploring and  thinking critically about     .
#  missing data is an important part of data analysis, and in a real-life      .
#  scenario, you should consider the most appropriate method for handling them .
#                                                                              .
#...............................................................................

# load packages ----
library(tidyverse)
library(leaflet)

# read in data ----
lake_monitoring_data <- read_csv(here::here("raw_data/FCWO_lakemonitoringdata_2011_2022_daily.csv"))

# remove missing data, calculate avg depth & temp ----
avg_depth_temp <- lake_monitoring_data |> 
  select(Site, Depth, BedTemperature) |> 
  filter(Depth != "NaN") |> # remove NaN (missing data) from Depth
  drop_na(BedTemperature) |> # remove NAs (missing data) from BedTemperature
  group_by(Site) |> 
  summarize(
    AvgDepth = round(mean(Depth), 1),
    AvgTemp = round(mean(BedTemperature), 1)
  )

# join avg depth & temp to original data (match rows based on 'Site') ---
lake_monitoring_data <- full_join(lake_monitoring_data, avg_depth_temp)

# get unique lakes observations (with corresponding lat, lon, elev, avgDepth, avgTemp) for mapping ----
unique_lakes <- lake_monitoring_data |> 
  select(Site, Latitude, Longitude, Elevation, AvgDepth, AvgTemp) |> 
  distinct() |> 
  mutate(Site = as_factor(Site))

# save processed data to your app's data directory ----
write_csv(unique_lakes, here::here("shinydashboard/data/lake_data_processed2.csv"))
