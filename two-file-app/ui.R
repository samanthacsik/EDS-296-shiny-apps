ui <- fluidPage(
  
  # navbar page ----
  navbarPage(
    
    "My App Title",
    
    # (Page 1) intro tabPanel ----
    tabPanel(title = "About this App",
      
      "background info will go here" # REPLACE THIS WITH CONTENT
      
    ), # END (Page 1) intro tabPanel
    
    # (Page 2) data viz tabPanel ----
    tabPanel(title = "Animal Data Explorer",
      
      # tabsetPanel to contain tabs for data viz ----
      tabsetPanel(
        
        # trout tabPanel ----
        tabPanel(title = "Trout",
                
                 # trout plot sidebarLayout ----
                 sidebarLayout(
                   
                   # trout plot sidebarPanel ----
                   sidebarPanel(
                     
                     # channel type pickerInput ----
                     pickerInput(inputId = "channel_type_input", label = "Select channel type(s):",
                                 choices = unique(clean_trout$channel_type), 
                                 options = pickerOptions(actionsBox = TRUE),
                                 selected = c("cascade", "pool"),
                                 multiple = TRUE), # END channel type pickerInput
                     
                     # section checkboxGroupInput ----
                     checkboxGroupButtons(inputId = "section_input", label = "Select a sampling section:",
                                          choices = c("clear cut forest", "old growth forest"),
                                          selected = c("clear cut forest", "old growth forest"),
                                          individual = FALSE, justified = TRUE, size = "sm",
                                          checkIcon = list(yes = icon("ok", lib = "glyphicon"), no = icon("remove", lib = "glyphicon"))), # END section checkboxGroupInput
                   
                   ), # END trout plot sidebarPanel
                   
                   # trout plot mainPanel ----
                   mainPanel(
                     
                     plotOutput(outputId = "trout_scatterplot")
                     
                   ) # END trout plot mainPanel
                   
                 ) # END trout plot sidebarLayout
                 
                 ), # END trout tabPanel 
        
        # penguin tabPanel ----
        tabPanel(title = "Penguins",
                 
                 # penguin plot sidebarLayout ----
                 sidebarLayout(
                   
                   # penguin plot sidebarPanel ----
                   sidebarPanel(
                     
                     # island pickerInput ----
                     pickerInput(inputId = "penguin_island", label = "Select an island:",
                                 choices = c("Torgersen", "Dream", "Biscoe"),
                                 options = pickerOptions(actionsBox = TRUE),
                                 selected = c("Torgersen", "Dream", "Biscoe"),
                                 multiple = T), # END island pickerInput
                     
                     # bin number sliderInput ----
                     sliderInput(inputId = "bin_num", label = "Select number of bins:",
                                 value = 25, max = 100, min = 1), # END bin number sliderInput
                     
                   ), # END penguin plot sidebarPanel
                   
                   # penguin plot mainPanel ----
                   mainPanel(
                     
                    plotOutput(outputId = "flipperLength_histogram")
                     
                   ) # END penguin plot mainPanel
                   
                 ) # END penguin plot sidebarLayout
                 
                 ) # END penguin tabPanel
        
      ) # END tabsetPanel
      
    ) # END (Page 2) data viz tabPanel
    
  ) # END navbarPage
  
) # END fluidPage