ui <- fluidPage(
  
  tags$h1("Demoing Functions"),
  
  # tabsetPanel ----
  tabsetPanel(
    
    # scatterplot tab ----
    tabPanel(title = "Scatterplot",
             
             # species (scatterplot) pickerInput ----
             penguinSpp_pickerInput(inputId = "penguinSpp_scatterplot_input"),
             
             # scatterplot output ----
             plotOutput(outputId = "penguin_scatterplot_output")
             
    ), # END scatterplot tab
    
    # histogram tab ----
    tabPanel(title = "Histogram",
             
             # species (histogram) pickerInput ----
             penguinSpp_pickerInput(inputId = "penguinSpp_histogram_input"),
             
             # scatterplot output ----
             plotOutput(outputId = "penguin_histogram_output")
             
    ) # END histogram tab
    
  ) # END tabsetPanel
  
) # END fluidPage
