# WORKING APP

# load packages ----
library(shiny)
library(tidyverse)
library(reactlog)
library(palmerpenguins)

# ui ----
ui <- fluidPage(
  
  tabsetPanel(
    
    # tab 1 ----
    tabPanel(title = "Tab 1",
             
             # radio button input ----
             radioButtons(
               inputId = "img_input", label = "Choose a penguin to display:",
               choices = c("All penguins", "Sassy chinstrap", "Staring gentoo", "Adorable adelie"),
               selected = "All penguins"),
             
             # text output ----
             textOutput(outputId = "penguin_text_output"),
             
             # img output ----
             imageOutput(outputId = "penguin_img_output")
             
    ), # END tab 1
    
    # tab 2 ----
    tabPanel(title = "Tab 2",
             
             # body mass slider input ----
             sliderInput(inputId = "body_mass_input", label = "Select a range of body masses (g)",
                         min = 2700, max = 6300, value = c(3000, 4000)),

             # body mass plot output ----
             plotOutput(outputId = "bodyMass_scatterplot_output")
             
             ) # END tab 2
    
  ) # END tabsetPanel
  
) # END fluidPage


# server ----
server <- function(input, output){
  
  # render penguin text ----
  output$penguin_text_output <- renderText({
    
    message("Displaying text...")
    
    if(input$img_input == "All penguins"){
      "Meet all of our lovely penguins species!"
    }
    else if(input$img_input == "Sassy chinstrap"){
      "Chinstraps get their name from the thin black line that runs under their chins"
    }
    else if(input$img_input == "Staring gentoo"){
      "Gentoos stand out because of their bright orange bills and feet"
    }
    else if(input$img_input == "Adorable adelie"){
      "Adelie penguins are my personal favorite <3"
    }
  }) # END renderText
  
  
  # render penguin images ----
  output$penguin_img_output <- renderImage({
    
    message("Displaying image...")
    
    if(input$img_input == "All penguins"){
      list(src = "www/all_penguins.jpeg", height = 240, width = 300)
    }
    else if(input$img_input == "Sassy chinstrap"){
      list(src = "www/chinstrap.jpeg", height = 240, width = 300)
    }
    else if(input$img_input == "Staring gentoo"){
      list(src = "www/gentoo.jpeg", height = 240, width = 300)
    }
    else if(input$img_input == "Adorable adelie"){
      list(src = "www/adelie.gif", height = 240, width = 300)
    }
    
  }, deleteFile = FALSE) # END renderImage
  
  
  # filter body masses ----
  body_mass_df <- reactive({
    penguins |>
      filter(body_mass_g %in% input$body_mass_input[1]:input$body_mass_input[2]) # return observations where body_mass_g is "in" the set of options provided by the user in the sliderInput
  }) # END filter body masses


  # render the scatterplot output ----
  output$bodyMass_scatterplot_output <- renderPlot({

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

  }) # END render scatterplot

  
} # END server

# combine UI & server into an app ----
shinyApp(ui = ui, server = server)