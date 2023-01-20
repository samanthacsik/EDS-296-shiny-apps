filterSpp_df <- function(inputId) {
  
  data <- reactive ({
    
    penguins |>
      filter(species %in% input$inputId)
    
  })
  
  return(data)
  
}