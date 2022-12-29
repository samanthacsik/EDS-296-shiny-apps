#..............................setup.............................


library(shiny)
library(shinydashboard)


#...............................ui...............................


ui <- dashboardPage(
  
  dashboardHeader(), # END dashboardHeader
  dashboardSidebar(), # END dashboardSidebar
  dashboardBody() # END dashboardBody
  
) # END dashboardPage


#.............................server.............................


server <- function(input, output) {}


#......................combine ui & server.......................


shinyApp(ui, server)