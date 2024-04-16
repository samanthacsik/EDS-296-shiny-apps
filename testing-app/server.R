server <- function(input, output) {

  # Example 1 ------------------------------------------------------------------
  
  # text input ----
  output$greeting_output <- renderText({
    
    req(input$greet_input) # req(): textOutput doesn't appear until button is first pressed
    paste0("Hello ", isolate(input$name_input), "!") # isolate(): prevents textOutput from updating until button is pressed again
    
  })
  
  # Example 2 ------------------------------------------------------------------
  
  # file upload ----
  output$table_output <- renderTable({

    # NOTE: `input$csv_input` will be NULL initially
    # after user selects / uploads a file, it will be a df with 'name', 'size', 'type', 'datapath' cols
    # 'datapath' col will contain the local filenames where data can be found
    # see: https://shiny.posit.co/r/reference/shiny/1.4.0/fileinput
    
    inputFile <- input$csv_input
    
    if(is.null(inputFile))
      return(NULL)
    
    df <- read_csv(inputFile$datapath) |>
      rename("Temperature (C)" = "temp_c",
             "Precipitation (cm)" = "precip_cm",
             "Wind Speed (km/hr)" = "wind_kmhr",
             "Pressure (inHg)" = "pressure_inhg")
    return(df)

  })
  
  # Example 3 ------------------------------------------------------------------
  
  # filter penguin spp (scatterplot) ----
  filtered_spp_scatterplot_df <- reactive({
    
    penguins |> 
      filter(species %in% input$penguinSpp_scatterplot_input)
    
  })
  
  # render scatterplot ----
  output$scatterplot_output <- renderPlot({
    
    ggplot(na.omit(filtered_spp_scatterplot_df()),
           aes(x = bill_length_mm, y = bill_depth_mm,
               color = species, shape = species)) +
      geom_point() +
      geom_smooth(method = "lm", se = FALSE, aes(color = species)) + 
      scale_color_manual(values = c("Adelie" = "darkorange", "Chinstrap" = "purple", "Gentoo" = "cyan4")) +
      scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
      labs(x = "Flipper length (mm)", y = "Bill length (mm)",
           color = "Penguin species", shape = "Penguin species") +
      theme(legend.position = "bottom")
    
  })
  
  # filter penguin spp (histogram) ----
  filtered_spp_histogram_df <- reactive({
    
    penguins |> 
      filter(species %in% input$penguinSpp_histogram_input)
    
  })
  
  # render histogram ----
  output$histogram_output <- renderPlot({
    
    ggplot(na.omit(filtered_spp_histogram_df()),
           aes(x = flipper_length_mm, fill = species)) +
      geom_histogram(alpha = 0.5, position = "identity") +
      scale_fill_manual(values = c("Adelie" = "darkorange", "Chinstrap" = "purple", "Gentoo" = "cyan4")) +
      labs(x = "Flipper length (mm)", y = "Frequency",
           fill = "Penguin species") +
      theme(legend.position = "bottom")
    
  })
  
  
} # END server