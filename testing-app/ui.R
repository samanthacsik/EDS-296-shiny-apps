
ui <- fluidPage(
  
  h1("Let's test this app!"),
  
  br(),
  
  # Example 1 ------------------------------------------------------------------
  
  h3("Example 1"),
  
  # fluidRow (Ex 1: greeting) ----
  fluidRow(
    
    # greeting sidebarLayout ----
    sidebarLayout(
      
      # greeting sidebarPanel ----
      sidebarPanel(
        
        textInput(inputId = "name_input", 
                  label = "What is your name?"),
        
        actionButton(inputId = "greet_input", 
                     label = "Greet"),
        
      ), # END greeting sidebarPanel
      
      # greeting mainPanel ----
      mainPanel(
        
        textOutput(outputId = "greeting_output")
        
      ) # END greeting mainPanel
      
    ) # END greeting sidebarLayout 
    
  ), # END fluidRow (Ex 1: greeting)
  
  tags$hr(),
  
  # Example 2 ------------------------------------------------------------------
  
  h3("Example 2"),
  
  # fluidRow (Ex 2: file upload) -----
  fluidRow(
    
    # file upload sidebarLayout ----
    sidebarLayout(
      
      # file upload sidebarPanel ----
      sidebarPanel(
        
        # upload fileInput -----
        fileInput(inputId = "csv_input",
                  label = "Upload your CSV file:",
                  multiple = FALSE,
                  accept = c(".csv", "text/csv", "text/comma-separated-values,text/plain"),
                  buttonLabel = "Browse",
                  placeholder = "No file selected"), # END upload fileInput
        
      ), # END file upload sidebarPanel
      
      # fileInput mainPanel ----
      mainPanel(
        
        tableOutput(outputId = "table_output")
        
      ) # END file upload mainPanel
      
    ) # END file upload sidebarLayout
    
  ), # END fluidRow (Ex 2: file upload)
  
  tags$hr(),
  
  # Example 3 ------------------------------------------------------------------
  
  # fluidRow (Ex 3: plot inputs) ----
  
  h3("Example 3"),
  
  fluidRow(
    column(width = 6,
           pickerInput(inputId = "penguinSpp_scatterplot_input", label = "Select a species (scatterplot):",
                       choices = c("Adelie", "Chinstrap", "Gentoo"),
                       selected = c("Adelie", "Chinstrap", "Gentoo"),
                       options = pickerOptions(actionsBox = TRUE),
                       multiple = TRUE)),
    column(width = 6,
           pickerInput(inputId = "penguinSpp_histogram_input", label = "Select a species (histogram):",
                       choices = c("Adelie", "Chinstrap", "Gentoo"),
                       selected = c("Adelie", "Chinstrap", "Gentoo"),
                       options = pickerOptions(actionsBox = TRUE),
                       multiple = TRUE)),
  ), # END fluidRow (Ex 3: plot inputs)
  
  # fluidRow (Ex 3: plot outputs) ----
  fluidRow(
    column(width = 6,
           plotOutput(outputId = "scatterplot_output")),
    column(width = 6,
           plotOutput(outputId = "histogram_output")),
  ) # END fluidRow (Ex 3: plot outputs)
  
) # END fluidPage






# ui <- navbarPage(
#   
#   title = "Let's test this app!",
#   
#   # Background -----------------------------------------------------------------
#   
#   # background tabPanel ----
#   tabPanel(title = "Background",
#            
#            # intro text fluidRow ----
#            fluidRow(
#              
#              # use columns to create white space on sides
#              column(1),
#              column(10, includeMarkdown("text/about.md")),
#              column(1)
#              
#            ), # END intro text fluidRow
#            
#            hr(), # creates light gray horizontal line
#            
#            # footer text ----
#            column(1),
#            column(10, includeMarkdown("text/footer.md")),
#            column(1) # END footer text
#            
#   ), # END background tabPanel
#   
#   # Example 1 ------------------------------------------------------------------
#   
#   # (Ex 1) text input greeting tabPanel ----
#   tabPanel(title = "Ex 1: Text input",
#            
#            # greeting sidebarLayout ----
#            sidebarLayout(
#              
#              # greeting sidebarPanel ----
#              sidebarPanel(
#                
#                textInput(inputId = "name_input", 
#                          label = "What is your name?"),
#                
#                actionButton(inputId = "greet_input", 
#                             label = "Greet"),
#                
#              ), # END greeting sidebarPanel
#              
#              # greeting mainPanel ----
#              mainPanel(
#                
#                textOutput(outputId = "greeting_output")
#                
#                ) # END greeting mainPanel
#              
#            ) # END greeting sidebarLayout 
#            
#   ), # END (Ex 1) text input greeting tabPanel
#   
#   # Example 2 ------------------------------------------------------------------
#   
#   # (Ex 2) file upload tabPanel ----
#   tabPanel(title =  "Ex 2: File input",
#            
#            # file upload sidebarLayout ----
#            sidebarLayout(
#              
#              # file upload sidebarPanel ----
#              sidebarPanel(
#                
#                # upload fileInput -----
#                fileInput(inputId = "csv_input", 
#                          label = "Upload your CSV file:",
#                          multiple = FALSE, 
#                          accept = c(".csv", "text/csv", "text/comma-separated-values,text/plain"),
#                          buttonLabel = "Browse",
#                          placeholder = "No file selected"), # END upload fileInput
#                
#              ), # END file upload sidebarPanel 
#              
#              # fileInput mainPanel ----
#              mainPanel(
#                
#                tableOutput(outputId = "table_output")
#         
#                ) # END file upload mainPanel
#              
#            ) # END file upload sidebarLayout
#            
#   ), # END (Ex 2) file input tabPanel
#   
#   # Example 3 ------------------------------------------------------------------
#   
#   # (Ex 3) plot tabPanel ----
#   tabPanel(title =  "Ex 3: Plot",
#            
#            # input fluidRow ----
#            fluidRow(
#              column(1),
#              column(5,
#                     pickerInput(inputId = "penguinSpp_scatterplot_input", label = "Select a species (scatterplot):",
#                                 choices = c("Adelie", "Chinstrap", "Gentoo"),
#                                 selected = c("Adelie", "Chinstrap", "Gentoo"),
#                                 options = pickerOptions(actionsBox = TRUE),
#                                 multiple = TRUE)),
#              column(5,
#                     pickerInput(inputId = "penguinSpp_histogram_input", label = "Select a species (histogram):",
#                                 choices = c("Adelie", "Chinstrap", "Gentoo"),
#                                 selected = c("Adelie", "Chinstrap", "Gentoo"),
#                                 options = pickerOptions(actionsBox = TRUE),
#                                 multiple = TRUE)),
#              column(1)
#            ), # END input fluidRow
#            
#            # output fluidRow ----
#            fluidRow(
#              column(1),
#              column(5,
#                     plotOutput(outputId = "scatterplot_output")),
#              column(5,
#                     plotOutput(outputId = "histogram_output")),
#              column(1)
#            ) # END output fluidRow 
#            
#   ) # END (Ex 3) plot tabPanel
#   
# ) # END navbarPage