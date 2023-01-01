server <- function(input, output, session) {
  data <- reactive({
    req(input$upload)
    
    ext <- tools::file_ext(input$upload$name)
    switch(ext,
           csv = vroom::vroom(input$upload$datapath, delim = ","),
           tsv = vroom::vroom(input$upload$datapath, delim = "\t"),
           validate("Invalid file; Please upload a .csv or .tsv file")
    )
  })
  
  output$head <- renderTable({
    head(data(), input$n)
  })
}






# server <- function(input, output) {
#   
#   
#   observeEvent(input$p_file,{
#     
#     if(is.null(input$file_input$datapath)){
#       showModal(modalDialog(
#         title = "Warning",
#         "Please upload a csv file",
#         easyClose = TRUE
#       ))
#       
#     } else{
#       input$file_input$datapath %>% 
#         read_csv() -> df
#       
#       if("ID" %in% colnames(df)){
#         output$button_rui <- renderUI(
#           actionButton("pp_file","Process File"),
#         )
#         
#       } else {
#         showModal(modalDialog(
#           title = "Warning",
#           "File is not of correct format",
#           easyClose = TRUE
#         ))
#       }
#       
#     }
#   }) 
# } # END server
