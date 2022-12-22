ui <- fluidPage(
  
  # navbar page ----
  navbarPage(
    
    "My app title",
    
    # (Page 1) intro tabPanel ----
    tabPanel(title = "Welcome to my app",
      
      "background info will go here" # REPLACE THIS WITH CONTENT
      
    ), # END (Page 1) intro tabPanel
    
    # (Page 2) data viz tabPanel ----
    tabPanel(title = "Explore the data",
      
      # tabsetPanel to contain tabs for data viz ----
      tabsetPanel(
        
        tabPanel(title = "Crab",
                 
                 # crab plot sidebarLayout ----
                 sidebarLayout(
                   
                   # crab plot sidebarPanel ----
                   sidebarPanel(
                     
                     "crab plot input(s) go here" # REPLACE THIS WITH CONTENT
                     
                   ), # END crab plot sidebarPanel
                   
                   # crab plot mainPanel ----
                   mainPanel(
                     
                     "crab plot output goes here" # REPLACE THIS WITH CONTENT
                     
                   ) # END crab plot mainPanel
                   
                 ) # END crab plot sidebarLayout
                 
                 ), # END crab tabPanel
        
        tabPanel(title = "Trout",
                
                 # trout plot sidebarLayout ----
                 sidebarLayout(
                   
                   # trout plot sidebarPanel ----
                   sidebarPanel(
                     
                     "trout plot input(s) go here" # REPLACE THIS WITH CONTENT
                     
                   ), # END trout plot sidebarPanel
                   
                   # trout plot mainPanel ----
                   mainPanel(
                     
                     "trout plot output goes here" # REPLACE THIS WITH CONTENT
                     
                   ) # END trout plot mainPanel
                   
                 ) # END trout plot sidebarLayout
                 
                 ), # END trout tabPanel 
        
        tabPanel(title = "Bison",
                 
                 # bison plot sidebarLayout ----
                 sidebarLayout(
                   
                   # bison plot sidebarPanel ----
                   sidebarPanel(
                     
                     "bison plot input(s) go here" # REPLACE THIS WITH CONTENT
                     
                   ), # END bison plot sidebarPanel
                   
                   # bison plot mainPanel ----
                   mainPanel(
                     
                     "bison plot output goes here" # REPLACE THIS WITH CONTENT
                     
                   ) # END bison plot mainPanel
                   
                 ) # END bison plot sidebarLayout
                 
                 ) # END bison tabPanel
        
      ) # END tabsetPanel
      
    ) # END (Page 2) data viz tabPanel
    
  ) # END navbarPage
  
) # END fluidPage