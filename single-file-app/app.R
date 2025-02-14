# one-file-app

# load packages ----
library(shiny)
library(palmerpenguins)
library(tidyverse)
library(DT)
library(bslib)

# ---- use thematic to match plots theme with app theme (comment/uncomment line below to see how {thematic} changes appearance of ggplot) ----
# thematic::thematic_shiny()

# user interface ----
ui <- fluidPage(
  
  # ---- add pre-built bootswatch theme using {bslib} ----
  # theme = bslib::bs_theme(bootswatch = "solar"),
  
  # ---- OR create your own theme using {bslib} ----
  # theme = bslib::bs_theme(
  #   bg = "#A36F6F", # background color
  #   fg = "#FDF7F7", # foreground color
  #   primary = "#483132", # primary accent color
  #   base_font = font_google("Pacifico"),
  #   code_font = font_google("JetBrains Mono")),

  # app title ----
  tags$h1("My App Title"),
  
  # app subtitle ----
  h4(strong("Exploring Antarctic Penguin Data")),
  
  # body mass slider input ----
  sliderInput(inputId = "body_mass_input", label = "Select a range of body masses (g)",
              min = 2700, max = 6300, value = c(3000, 4000)),

  # body mass plot output ----
  plotOutput(outputId = "body_mass_scatterplot_output"),
  
  # year input ----
  checkboxGroupInput(inputId = "year_input", 
                     label = "Select year(s):",
                     choices = c("2007", "2008", "2009"), # or `unique(penguins$year)` | NOTE: update checkbox display name by using "New name" = "observation name" (e.g "The year 2007" = "2007")
                     selected = c("2008", "2009")),
  
  # DT output ----
  DT::dataTableOutput(outputId = "penguin_DT_output")
  
) # END fluidPage

# server instructions ----
server <- function(input, output) {
  
  # bs_themer()
  
  # filter body masses ----
  body_mass_df <- reactive({
    penguins |>
      filter(body_mass_g %in% c(input$body_mass_input[1]:input$body_mass_input[2])) # return observations where body_mass_g is "in" the set of options provided by the user in the sliderInput
  })

  # render the scatterplot output ----
  output$body_mass_scatterplot_output <- renderPlot({

    ggplot(na.omit(body_mass_df()),
           aes(x = flipper_length_mm, y = bill_length_mm,
               color = species, shape = species)) +
      geom_point() +
      scale_color_manual(values = c("Adelie" = "darkorange", "Chinstrap" = "purple", "Gentoo" = "cyan4")) +
      scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
      labs(x = "Flipper length (mm)", y = "Bill length (mm)",
           color = "Penguin species", shape = "Penguin species") +
      guides(color = guide_legend(position = "inside"),
             size = guide_legend(position = "inside")) +
      theme_minimal() +
      theme(legend.position.inside = c(0.85, 0.2), 
            legend.background = element_rect(color = "white"))
    
  })
  
  # filter for years ----
  years_df <- reactive({
    penguins |> 
      filter(year %in% c(input$year_input)) # return observations where year is "in" the set of options provided by the user via the checkboxGroupInput
  })
  
  # render the DT::datatable ----
  output$penguin_DT_output <- DT::renderDataTable({
    
    DT::datatable(years_df(),
                  options = list(pagelength = 10),
                  rownames = FALSE)
    
  })
  
}

# combine UI & server into an app ----
shinyApp(ui = ui, server = server)