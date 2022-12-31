ui <- fluidPage(
  
  tags$h1("Demoing UI Functions"),
  
  # tabsetPanel ----
  tabsetPanel(
    
    # scatterplot tab ----
    tabPanel("Scatterplot",
             
             # species (scatterplot) pickerInput ----
             # pickerInput(inputId = "penguin_species_scatterplot", label = "Select a species:",
             #             choices = c("Adelie", "Chinstrap", "Gentoo"),
             #             options = pickerOptions(actionsBox = TRUE),
             #             selected = c("Adelie", "Chinstrap", "Gentoo"),
             #             multiple = T), 
             penguinSpp_pickerInput(inputId = "penguin_species_scatterplot"),
             
             # scatterplot output ----
             plotOutput(outputId = "penguin_scatterplot")
             
             ), # END scatterplot tab
    
    
    # histogram tab ----
    tabPanel("Histogram",
             
             # species (histogram) pickerInput ----
             # pickerInput(inputId = "penguin_species_histogram", label = "Select a species:",
             #             choices = c("Adelie", "Chinstrap", "Gentoo"),
             #             options = pickerOptions(actionsBox = TRUE),
             #             selected = c("Adelie", "Chinstrap", "Gentoo"),
             #             multiple = T), 
             penguinSpp_pickerInput(inputId = "penguin_species_histogram"),
             
             # scatterplot output ----
             plotOutput(outputId = "penguin_histogram")
             
             ) # END histogram tab
    
  ) # END tabsetPanel
  
) # END fluidPage
