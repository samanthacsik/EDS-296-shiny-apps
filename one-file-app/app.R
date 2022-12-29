# load packages ----
library(shiny)
library(palmerpenguins)
library(tidyverse)
library(DT)

# user interface ----
ui <- fluidPage(
  
  # app title ----
  tags$h1("My App Title"),
  
  # app subtitle ----
  p(strong("Exploring Antarctic Penguin Data")),
  
  # body mass slider input ----
  sliderInput(inputId = "body_mass", label = "Select a range of body masses (g)",
              min = 2700, max = 6300, value = c(3000, 4000)),

  # body mass plot output ----
  plotOutput(outputId = "bodyMass_scatterPlot"),
  
  # year input ----
  checkboxGroupInput(inputId = "year", label = "Select year(s):",
                     choices = c("2007", "2008", "2009"), # or `unique(penguins$year)` | NOTE: update checkbox display name by using "New name" = "observation name" (e.g "The year 2007" = "2007")
                     selected = c("2007", "2008")),
  
  # DT output ----
  DT::dataTableOutput(outputId = "penguin_data")
  
)

# server instructions ----
server <- function(input, output) {
  
  # filter body masses ----
  body_mass_df <- reactive({
    penguins |>
      filter(body_mass_g %in% input$body_mass[1]:input$body_mass[2]) # return observations where body_mass_g is "in" the set of options provided by the user in the sliderInput
  })

  # render the scatterplot output ----
  output$bodyMass_scatterPlot <- renderPlot({

    ggplot(na.omit(body_mass_df()),
           aes(x = flipper_length_mm, y = bill_length_mm,
               color = species, shape = species)) +
      geom_point() +
      scale_color_manual(values = c("Adelie" = "#FEA346", "Chinstrap" = "#B251F1", "Gentoo" = "#4BA4A4")) +
      scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
      labs(x = "Flipper length (mm)", y = "Bill length (mm)",
           color = "Penguin species", shape = "Penguin species") +
      theme_minimal() +
      theme(legend.position = c(0.85, 0.2),
            legend.background = element_rect(color = "white"))
    
  })
  
  # filter for years ----
  years_df <- reactive({
    penguins |> 
      filter(year %in% input$year) # return observations where year is "in" the set of options provided by the user via the checkboxGroupInput
  })
  
  # render the DT::datatable ----
  output$penguin_data <- DT::renderDataTable({
    
    DT::datatable(years_df(),
                  options = list(pagelength = 10),
                  rownames = FALSE)
    
  })
  
}

# combine UI & server into an app ----
shinyApp(ui = ui, server = server)