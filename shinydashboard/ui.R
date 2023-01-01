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
                  img(src = "fishCreek_map.jpeg", style = "max-width: 100%;"),
                  tags$h6(tags$em("Map Source:", tags$a(href = "http://www.fishcreekwatershed.org/", "FCWO")), 
                          style = "text-align: center;")
                  ), # END box 
              
            ), # END left-hand column
            
            # right-hand column ----
            column(width = 6,
                   
                   # first fluidRow ----
                   fluidRow(
                     box(width = 12,
                         title = tagList(icon("table"), strong("Data Source")),
                         includeMarkdown("text/citation.md")
                         ) 
                   ), # END first fluidRow
                   
                   # second fluiRow ----
                   fluidRow(
                     box(width = 12,
                         title = tagList(icon("triangle-exclamation"), strong("Disclaimer")),
                         includeMarkdown("text/disclaimer.md")
                         )
                   ) # END second fluidRow
                   
            ) # END right-hand column
            
            # # 1st fluidRow ----
            # fluidRow(
            #   
            #   # background info box ----
            #   box(width = 6,
            #       
            #       title = tagList(icon("water"), "Monitoring Fish Creek Watershed"),# "Monitoring Fish Creek Watershed",
            #       
            #       includeMarkdown("text/intro.md"),
            #       
            #       img(src = "fishCreek_map.jpeg", 
            #           style = "max-width: 100%;"),
            #       
            #       tags$h6(tags$em("Map Source:", tags$a(href = "http://www.fishcreekwatershed.org/", "FCWO")),
            #               style = "text-align: center;")
            #       
            #   ), # END background box
            #   
            #   # photo tabBox ----
            #   tabBox(width = 6,
            #          
            #          # NOTE: titles can include an icon
            #          # title = tagList(icon("table"), "Title"),
            #          
            #          # Tab 1 ----
            #          tabPanel(title = "Data Source", #"Lower Snowman Lake",
            #                   
            #                   includeMarkdown("text/citation.md")
            #                   
            #                   # lower snowman img ----
            #                   # img(
            #                   #   scr = "lowersnowman.jpeg",
            #                   #   alt = "A helicopter sits on the bank of a partially-frozen lake, Lower Snowman, while three researchers collect samples with various pieces of equipment."
            #                   #   ),# END lowersnowman img
            #                   # 
            #                   # tags$h6(tags$em("Photo Source:", tags$a(href = "http://www.fishcreekwatershed.org/lowerSnowman-lake.html", "FCWO")))
            #                   
            #          ), # END Tab 1
            #          
            #          # Tab 2 ----
            #          tabPanel(title = "Contribute" # "Snowman Creek",
            #                   
            #                   #includeMarkdown()
            #                   # snowman creek img ----
            #                   # img(
            #                   #   scr = "snowmancreek.jpeg",
            #                   #   alt = "Snow-covered banks alongside Snowman Creek."
            #                   # ),# END lowersnowman img
            #                   # 
            #                   # tags$h6(tags$em("Photo Source:", tags$a(href = "http://www.fishcreekwatershed.org/snowman-creek.html", "FCWO")))
            #                   
            #          ), # END Tab 2
            #          
            #          # Tab 3 ----
            #          tabPanel(title = "Disclaimer",
            #                   
            #                   includeMarkdown("text/disclaimer.md"))
            #          
            #   ) # END photo tabBox ----
            #   
            # ) # END 1st fluidRow
            
            # # 2nd fluidRow ----
            # fluidRow(
            #   
            #   # citation box ----
            #   box(width = 12,
            #       
            #       # includeMarkdown("text/citation.md")
            #       includeMarkdown("text/disclaimer.md")
            #       
            #   ) # END citation box
            #   
            # ), # END 2nd fluidRow
            
            # includeMarkdown("text/disclaimer.md")
            
    ), # END welcome tabItem 
    
    # dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            # fluidRow ----
            fluidRow(
              
              # input box ----
              box(width = 4,
                  
                  title = "Adjust lake parameter ranges:",
                  
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
                  
                  title = "Monitored lakes within Fish Creek Watershed:",
                  
                  # leaflet output ----
                  leafletOutput(outputId = "lake_map") |> withSpinner(type = 1, color = "#4287f5")
                  
              ) # END leaflet box
              
            ) # END fluidRow
            
    ) # END dashboard tabItem
    
  ) # END tabItems
  
) # END dashboardBody

#..................combine all in dashboardPage..................
dashboardPage(header, sidebar, body)