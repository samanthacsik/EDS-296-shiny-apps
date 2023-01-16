
#..............................setup.............................
library(shiny)
library(gapminder)
library(dplyr)
source("gapModule.R")

# Note: This code creates data sets to use in each tab.
# It removes Kuwait since Kuwait distorts the gdp scale
all_data <- filter(gapminder, country != "Kuwait")
africa_data <- filter(gapminder, continent == "Africa")
americas_data <- filter(gapminder, continent == "Americas")
asia_data <- filter(gapminder, continent == "Asia", country != "Kuwait")
europe_data <- filter(gapminder, continent == "Europe")
oceania_data <- filter(gapminder, continent == "Oceania")

#...............................ui...............................
ui <- fluidPage(
  
  # app title ----
  titlePanel("Gapminder"),
  
  # continent tabsetPanel ----
  tabsetPanel(id = "continent", 
              tabPanel(title = "All", gapModuleUI(id = "all")),
              tabPanel(title = "Africa", gapModuleUI(id = "africa")),
              tabPanel(title = "Americas", gapModuleUI(id = "americas")),
              tabPanel(title = "Asia", gapModuleUI(id = "asia")),
              tabPanel(title = "Europe", gapModuleUI(id = "europe")),
              tabPanel(title = "Oceania", gapModuleUI(id = "oceania"))
              
  ) # END continent tabsetPanel
  
) # END fluidPage

#.............................server.............................
server <- function(input, output) {
  
  gapModuleServer(id = "all", data = all_data)
  gapModuleServer(id = "africa", data = africa_data)
  gapModuleServer(id = "americas", data = americas_data)
  gapModuleServer(id = "asia", data = asia_data)
  gapModuleServer(id = "europe", data = europe_data)
  gapModuleServer(id = "oceania", data = oceania_data)

} # END server

# Run the application 
shinyApp(ui = ui, server = server)