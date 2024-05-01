penguinSpp_pickerInput <- function(inputId) {

  pickerInput(inputId = inputId, label = "Select species:",
              choices = c("Adelie", "Chinstrap", "Gentoo"),
              selected = c("Adelie", "Chinstrap", "Gentoo"),
              options = pickerOptions(actionsBox = TRUE),
              multiple = TRUE)
  
}