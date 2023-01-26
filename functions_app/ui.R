ui <- fluidPage(
  
  tags$h1("Demoing Functions"),
  
  # tabsetPanel ----
  tabsetPanel(
    
    # scatterplot tab ----
    tabPanel("Scatterplot",
             
             # species (scatterplot) pickerInput ----
             penguinSpp_pickerInput(inputId = "penguin_species_scatterplot"),
             
             # scatterplot output ----
             plotOutput(outputId = "penguin_scatterplot")
             
    ), # END scatterplot tab
    
    # histogram tab ----
    tabPanel("Histogram",
             
             # species (histogram) pickerInput ----
             penguinSpp_pickerInput(inputId = "penguin_species_histogram"),
             
             # scatterplot output ----
             plotOutput(outputId = "penguin_histogram")
             
    ) # END histogram tab
    
  ) # END tabsetPanel
  
) # END fluidPage
