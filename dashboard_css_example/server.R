server <- function(input, output) {
  
  # penguin spp reactive df----
  penguin_spp <- reactive({
    
    palmerpenguins::penguins %>%
      filter(species %in% input$penguin_species) %>%
      select(species, island, bill_length_mm, bill_depth_mm)
    
  }) # END penguin spp reactive df
  
  
  # plot ----
  output$penguin_plot <- renderPlot({
    
    ggplot(penguin_spp(), aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
      geom_point() + 
      scale_color_manual(values = c("Adelie" = "#FEA346", "Chinstrap" = "#B251F1", "Gentoo" = "#4BA4A4"))
    
  }) # END plot 
  
}