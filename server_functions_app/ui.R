ui <- fluidPage(
  fileInput("upload", NULL, accept = c(".csv", ".tsv")),
  numericInput("n", "Rows", value = 5, min = 1, step = 1),
  tableOutput("head")
)






# ui <- fluidPage(
#   
#   # fileInput ----
#   fileInput(inputId = "file_input", label = "Choose your file in csv",
#             multiple = FALSE,
#             accept = c("text/csv",
#                        "text/comma-separated-values,text/plain",
#                        ".csv")
#             ), # END fileInput 
#   
#   # actionButton ----
#   actionButton(inputId = "p_file", label = "Upload File"),
#   
#   # uiOutput ----
#   uiOutput(outputId = "button_rui")
# 
#   ) # END fluidPage
