server <- function(input, output) {
  
  # filter data & create penguin scatterplot ----
  output$penguin_scatterplot <- build_penguin_scatterplot(input)
  
  # filter data & create penguin histogram ----
  output$penguin_histogram <- build_penguin_histogram(input)

} # END server
