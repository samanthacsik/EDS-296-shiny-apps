library(shiny)

ui <- fluidPage(
  
  textInput("name", "What is your name?"),
  actionButton("greet", "Greet"),
  textOutput("greeting")
  
)

server <- function(input, output, session) {
  
  output$greeting <- renderText({
    req(input$greet)
    paste0("Hello ", isolate(input$name), "!")
    
  })
  
}

shinyApp(ui, server)










# #..............................setup.............................
# library(shiny)
# library(tidyverse)
# library(DT)
# library(palmerpenguins)
# 
# #...............................ui...............................
# ui <- fluidPage(
#   
#   # sidebarLayout ----
#   sidebarLayout(
#     
#     # sidebarPanel ----
#     sidebarPanel(
#       
#       # penguin spp checkboxGroupInput ----
#       checkboxGroupInput(
#         inputId = "penguin_species",
#         label = "Filter by species: ",
#         choices = c("Adelie", "Chinstrap", "Gentoo"),
#         selected = c("Adelie", "Chinstrap", "Gentoo")
#       ), # END penguin spp checkboxGroupInput 
#       
#       # csv download button ----
#       downloadButton(
#         outputId = "download_csv",
#         label = "Download CSV"
#       ) # END csv download button 
#       
#     ), # END sidebarpanel
#     
#     # mainPanel ----
#     mainPanel(
#       
#       # reactive page title ----
#       tags$h1(
#         htmlOutput(outputId = "penguin_count", inline = TRUE), " Palmer Penguins"
#       ), # END reactive page title
#       
#       # penguin scatterplot output ----
#       plotOutput(outputId = "penguin_scatterplot"),
#       
#       # data table output ----
#       DT::DTOutput(outputId = "penguin_datatable")
#       
#     ) # END mainPanel
#     
#   ) # END sidebarLayout
#   
# ) # END fluidPage
# 
# #.............................server.............................
# server <- function(input, output, session) {
#   
#   # filter penguin spp df ----
#   filtered_spp <- reactive({
#     
#     # validation error message 
#     validate(need(input$penguin_species, "You must have at least one species selected"))
#     
#     # filter data
#     penguins  |> 
#       filter(species %in% input$penguin_species)  |> 
#       select(species, island, bill_length_mm, bill_depth_mm)
#     
#   }) # END filter penguin spp df
#   
#   # reactive title number ----
#   penguin_count <- reactive({
#     
#     req(input$penguin_species)
#     nrow(filtered_spp())
#     
#   })
# 
#   # reactive title value output ----
#   output$penguin_count <- renderUI(penguin_count())
#   
#   # penguin scatterplot output ----
#   output$penguin_scatterplot <- renderPlot({
#     
#     ggplot(filtered_spp(), aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
#       geom_point() 
#     
#   }) # END render penguin scatterplot output 
#   
#   # DT datatable output ----
#   output$penguin_datatable <- DT::renderDT({
#     
#     DT::datatable(filtered_spp())
#     
#   }) # END DT datatable output 
#   
#   # Download CSV of filtered data ----
#   output$download_csv <- downloadHandler(
#     
#     filename = function() { "penguins.csv" },
#     
#     content = function(file) { write_csv(filtered_spp(), file) }
#     
#   ) # END downloadHandler
#   
# } # END server
# 
# #......................combine ui & server.......................
# shinyApp(ui, server)



# OLD TESTING NOTES
# - uncheck "Gentoo"
# - download CSV
# - click "Expect Shiny values" (keeps track of input, output, and exported values)
# - give Test Name ("Appsilon")
# - save test and exit -- shiny will save that recorded test and setup the testing infrastructure if it doesn't exist already


