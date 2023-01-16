#..........................ui function...........................
gapModuleUI <- function(id) {

  # create namespace function ----
  ns <- NS(id)
  
  # tagList() surrounds multiple UI elements in UI function to return all objects (normally, functions only return the thing that's run last)
  tagList(
    
    # plotOutput ----
    plotOutput(outputId = ns("plot")),
    
    # sliderInput ----
    sliderInput(inputId = ns("year"), label = "Select Year", 
                value = 1952, min = 1952, max = 2007, step = 5,  
                animate = animationOptions(interval = 500))
    
  ) # END tagList
  
} # END UI function


#........................server function.........................
gapModuleServer <- function(id, data) {
  
  moduleServer(id, function(input, output, session) {

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~ SERVER CODE ~~~~~~~~~~~~~~~~~~~~~~~~~~~   
    # creactive df to collect one year of data ----
    ydata <- reactive({
      filter(data, year == input$year)
    }) # END reactive df
    
    # set slider range ----
    xrange <- range(data$gdpPercap)
    yrange <- range(data$lifeExp)
    
    # render plot -----
    output$plot <- renderPlot({
      
      # draw background plot with legend
      plot(data$gdpPercap, data$lifeExp, type = "n", 
           xlab = "GDP per capita", ylab = "Life Expectancy", 
           panel.first = {
             grid()
             text(mean(xrange), mean(yrange), input$year, 
                  col = "grey90", cex = 5)
           })
      
      # build legend
      legend("bottomright", legend = levels(data$continent), 
             cex = 1.3, inset = 0.01, text.width = diff(xrange)/5,
             fill = c("#E41A1C99", "#377EB899", "#4DAF4A99", 
                                 "#984EA399", "#FF7F0099"))
                                 
      # determine bubble colors
      cols <- c("Africa" = "#E41A1C99",
                "Americas" = "#377EB899",
                "Asia" = "#4DAF4A99",
                "Europe" = "#984EA399",
                "Oceania" = "#FF7F0099")[ydata()$continent]
      
      # add bubbles
      symbols(ydata()$gdpPercap, ydata()$lifeExp, circles = sqrt(ydata()$pop),
              bg = cols, inches = 0.5, fg = "white", add = TRUE)
      
    }) # END renderPlot

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~ SERVER CODE ~~~~~~~~~~~~~~~~~~~~~~~~~~~      
    
  }) # END moduleServer
  
} # END server function
