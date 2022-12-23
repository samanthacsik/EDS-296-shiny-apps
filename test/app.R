# app.R
library(shiny)

ui<- shinyUI(
  fluidPage(
    title = "Footer example App",
    sidebarLayout(
      sidebarPanel(
        "sidebar",
        selectInput(
          "pet",
          "Pet", 
          c("Cat", "Dog", "Fish")
        )
      ),
      mainPanel("hello world")
    ),
    # WHERE YOUR FOOTER GOES
    hr(),
    print("~~~my disclaimer~~~~")
  )
)

server <- function(input, output) {
  # empty for minimal example
}

shinyApp(ui=ui, server = server)