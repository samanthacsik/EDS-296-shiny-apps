build_penguin_histogram <- function(input) {
  
  # filter penguin spp ----
  filtered_spp_histogram <- reactive ({
    
    penguins |>
      filter(species %in% input$penguin_species_histogram_input)
    
  })
  
  # render histogram ----
  renderPlot({
   
    ggplot(na.omit(filtered_spp_histogram()), 
           aes(x = flipper_length_mm, fill = species)) +
      geom_histogram() +
      scale_fill_manual(values = c("Adelie" = "#FEA346", "Chinstrap" = "#B251F1", "Gentoo" = "#4BA4A4")) +
      labs(x = "Flipper length (mm)", y = "Frequency",
           fill = "Penguin species")
    
  })
  
}