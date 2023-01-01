server <- function(input, output) {
  
  # filter lake data ----
  filtered_lakes <- reactive ({
    
    lake_data |>
      filter(Elevation >= input$elevation_slider[1] & Elevation <= input$elevation_slider[2])  |>
    filter(AvgDepth >= input$depth_slider[1] & AvgDepth <= input$depth_slider[2]) |>
    filter(AvgTemp >= input$temp_slider[1] & AvgTemp <= input$temp_slider[2])
    
  })
  
  
  
  # build leaflet map ----
  output$lake_map <- renderLeaflet({
    
    leaflet() |>
      
      # add tiles
      addProviderTiles("Esri.WorldImagery",
                       options = providerTileOptions(maxNativeZoom = 19, maxZoom = 100)) |>
      
      # add mini map
      addMiniMap(toggleDisplay = TRUE, minimized = TRUE) |>
      
      # set view over AK
      setView(lng = -152.048442, lat = 70.249234, zoom = 6) |>
      
      # add markers
      addMarkers(data =  filtered_lakes(),
                 lng = filtered_lakes()$Longitude, lat = filtered_lakes()$Latitude,
                 popup = paste("Site Name:", filtered_lakes()$Site, "<br>",
                               "Elevation:", filtered_lakes()$Elevation, "meters (above SL)", "<br>",
                               "Avg Depth:", filtered_lakes()$AvgDepth, "meters", "<br>",
                               "Avg Lake Bed Temperature:", filtered_lakes()$AvgTemp, "deg Celsius"))
    
  })
  
}