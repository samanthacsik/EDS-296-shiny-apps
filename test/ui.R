#........................dashboardHeader.........................
header <- dashboardHeader(
  
  # add title ----
  title = "Penguin Dashboard"
  
) # END dashboardHeader

#........................dashboardSidebar........................
sidebar <- dashboardSidebar(
  
  # sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))
    
  ) # END sidebarMenu
  
) # END dashboardSidebar

#..........................dashboardBody.........................
body <- dashboardBody(
  
  # link stylesheet
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
  ),
  
  # tabItems ----
  tabItems(
    
    # dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            # fluidRow ----
            fluidRow(
              
              # input box ----
              box(width = 4,
                  
                  checkboxGroupInput(
                    inputId = "penguin_species",
                    label = "Filter by species: ",
                    choices = c("Adelie", "Chinstrap", "Gentoo"),
                    selected = c("Adelie", "Chinstrap", "Gentoo")
                    
                  ) # END checkboxGroupInput
                  
              ), # END input box
              
              # output box ----
              box(width = 8,
                  
                  plotOutput(outputId = "penguin_plot")
                  
              ) # END output box
              
            ), # END fluidRow
            
    ) # END dashboard tabItem
    
  ) # END tabItems
  
) # END dashboardBody

#..................combine all in dashboardPage..................
dashboardPage(header, sidebar, body)
























# #..............................setup.............................
# library(shiny)
# 
# #...............................ui...............................
# ui <- fluidPage(
#   
#   tags$head(
#     tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
#   ),
#   
#   tags$h1("My app title"),
#   
#   tags$h3("Section 1"),
#   
#   tags$h3(class = "wide-letters", "Section 2"),
#   
#   tags$button("This is a button")
#   
# )
# 
# #.............................server.............................
# server <- function(input, output) {}
# 
# #......................combine ui & server.......................
# shinyApp(ui, server)




# library(shiny)
# library(ggplot2)
# library(dplyr)
# 
# ui <- fluidPage(
#   sidebarLayout(
#     sidebarPanel(
#       checkboxGroupInput(
#         inputId = "penguin_species",
#         label = "Filter by species: ",
#         choices = c("Adelie", "Chinstrap", "Gentoo"),
#         selected = c("Adelie", "Chinstrap", "Gentoo")
#       ),
#       downloadButton(
#         outputId = "download_csv",
#         label = "Download CSV"
#       )
#     ),
#     
#     mainPanel(
#       tags$h1(
#         tags$img(src = "https://allisonhorst.github.io/palmerpenguins/logo.png", height = "40px"),
#         htmlOutput(outputId = "penguin_count", inline = TRUE),
#         " Palmer Penguins"
#       ),
#       plotOutput(outputId = "penguin_scatterplot", height = "200px"),
#       DT::DTOutput(outputId = "penguin_datatable"),
#     )
#   )
# )
# 
# server <- function(input, output, session) {
#   
#   filtered_penguins <- reactive({
#     validate(need(input$penguin_species, "You must have at least one species selected"))
#     palmerpenguins::penguins %>%
#       filter(species %in% input$penguin_species) %>%
#       select(species, island, bill_length_mm, bill_depth_mm)
#   })
#   # Number
#   penguin_count <- reactive({
#     req(input$penguin_species)
#     nrow(filtered_penguins())
#   })
#   output$penguin_count <- renderUI(penguin_count())
#   
#   # Plot
#   output$penguin_scatterplot <- renderPlot({
#     ggplot(
#       filtered_penguins(),
#       aes(x = bill_length_mm, y = bill_depth_mm, color = species)
#     ) +
#       geom_point() +
#       facet_wrap(vars(island), nrow = 1, labeller = ggplot2::label_both)
#   })
#   
#   # Table
#   output$penguin_datatable <- DT::renderDT({
#     DT::datatable(filtered_penguins())
#   })
#   
#   # Download CSV of filtered data
#   output$download_csv <- downloadHandler(
#     filename = function() { "penguins.csv" },
#     content = function(file) {
#       readr::write_csv(filtered_penguins(), file)
#     }
#   )
#   
# }
# 
# shinyApp(ui, server)