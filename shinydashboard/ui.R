#........................dashboardHeader.........................
header <- dashboardHeader(
  
  # add title ----
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400
  
) # END dashboardHeader

#........................dashboardSidebar........................
sidebar <- dashboardSidebar(
  
  # sidebarMenu ----
  sidebarMenu(

    menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))

  ) # END sidebarMenu

) # END dashboardSidebar

#..........................dashboardBody.........................
body <- dashboardBody(
  
  # set theme ----
  # fresh::use_theme("shinydashboard_fresh_theme.css"),
  
  # tabItems ----
  tabItems(

    # welcome tabItem ----
    tabItem(tabName = "welcome",

            # left-hand column ----
            column(width = 6,

                   # box ----
                   box(width = NULL,
                       
                       title = tagList(icon("water"), strong("Monitoring Fish Creek Watershed")),
                       includeMarkdown("text/intro.md"),
                       tags$img(src = "FishCreekWatershedSiteMap_2020.jpeg", 
                           alt = "A map of Northern Alaksa, showing Fish Creek Watershed located within the National Petroleum Reserve.",
                       style = "max-width: 100%;"),
                       tags$h6(tags$em("Map Source:", tags$a(href = "http://www.fishcreekwatershed.org/", "FCWO")),
                               style = "text-align: center;")

                   ) # END box

            ), # END left-hand column

            # right-hand column ----
            column(width = 6,

                   # first fluidRow ----
                   fluidRow(

                     # data source box ----
                     box(width = NULL,
                         
                         title = tagList(icon("table"), strong("Data Source")),
                         includeMarkdown("text/citation.md")

                     ) # END data source box

                   ), # END first fluidRow

                   # second fluiRow ----
                   fluidRow(

                     # disclaimer box ----
                     box(width = NULL,

                         title = tagList(icon("triangle-exclamation"), strong("Disclaimer")),
                         includeMarkdown("text/disclaimer.md")

                     ) # END disclaimer box

                   ) # END second fluidRow

            ) # END right-hand column

    ), # END welcome tabItem

    # dashboard tabItem ----
    tabItem(tabName = "dashboard",

            # fluidRow ----
            fluidRow(

              # input box ----
              box(width = 4,
                  
                  title = tags$strong("Adjust lake parameter ranges:"),

                  # sliderInputs ----
                  sliderInput(inputId = "elevation_slider", label = "Elevation (meters above SL):",
                              min = min(lake_data$Elevation), max = max(lake_data$Elevation),
                              value = c(min(lake_data$Elevation), max(lake_data$Elevation))),

                  sliderInput(inputId = "depth_slider", label = "Average depth (meters):",
                              min = min(lake_data$AvgDepth), max = max(lake_data$AvgDepth),
                              value = c(min(lake_data$AvgDepth), max(lake_data$AvgDepth))),

                  sliderInput(inputId = "temp_slider", label = "Average lake bed temperature (degrees C):",
                              min = min(lake_data$AvgTemp), max = max(lake_data$AvgTemp),
                              value = c(min(lake_data$AvgTemp), max(lake_data$AvgTemp)))

              ), # END input box

              # leaflet box ----
              box(width = 8,

                  title = tags$strong("Monitored lakes within Fish Creek Watershed:"),

                  # leaflet output ----
                  leafletOutput(outputId = "lake_map") |> withSpinner(type = 1, color = "#4287f5")

              ) # END leaflet box

            ) # END fluidRow

    ) # END dashboard tabItem

  ) # END tabItems
  
) # END dashboardBody

#..................combine all in dashboardPage..................
dashboardPage(header, sidebar, body)