ui <- fluidPage(
  
  # Feature 1 ------------------------------------------------------------------
  
  h3("Feature 1"),
  
  # fluidRow (Feature 1: greeting) ----
  fluidRow(
    
    # greeting sidebarLayout ----
    sidebarLayout(
      
      # greeting sidebarPanel ----
      sidebarPanel(
        
        textInput(inputId = "name_input",
                  label = "What is your name?"),
        
        actionButton(inputId = "greeting_button_input",
                     label = "Greet"),
        
      ), # END greeting sidebarPanel
      
      # greeting mainPanel ----
      mainPanel(
        
        textOutput(outputId = "greeting_output"),
        
      ) # END greeting mainPanel
      
    ) # END greeting sidebarLayout
    
  ), # END fluidRow (Feature 1: greeting)
  
  tags$hr(),
  
  # Feature 2 ------------------------------------------------------------------
  
  h3("Feature 2"),
  
  # fluidRow (Feature 2: file upload) -----
  fluidRow(
    
    # file upload sidebarLayout ----
    sidebarLayout(
      
      # file upload sidebarPanel ----
      sidebarPanel(
        
        # upload fileInput -----
        fileInput(inputId = "csv_input",
                  label = "Upload your CSV file:",
                  multiple = FALSE,
                  accept = c(".csv"),
                  buttonLabel = "Browse",
                  placeholder = "No file selected"), # END upload fileInput
        
      ), # END file upload sidebarPanel
      
      # fileInput mainPanel ----
      mainPanel(
        
        tableOutput(outputId = "summary_table_output")
        
      ) # END file upload mainPanel
      
    ) # END file upload sidebarLayout
    
  ), # END fluidRow (Feature 2: file upload)
  
  tags$hr(),
  
  # Feature 3 ------------------------------------------------------------------
  
  h3("Feature 3"),
  
  # fluidRow (Feature 3: plot) -----
  fluidRow(
    
    # plot sidebarLayout ----
    sidebarLayout(
      
      # plot sidebarPanel ----
      sidebarPanel(
        
        # penguin spp pickerInput -----
        penguinSpp_pickerInput(inputId = "penguinSpp_scatterplot_input")
        
      ), # END plot sidebarPanel
      
      # plot mainPanel ----
      mainPanel(
        
        plotOutput(outputId = "scatterplot_output")
        
      ) # END plot mainPanel
      
    ) # END plot sidebarLayout
    
  ) # END fluidRow (Feature 3: plot)
  
) # END fluidPage 