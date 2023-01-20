penguinSpp_pickerInput <- function(inputId) {
  pickerInput(inputId = inputId, label = "Select a species:",
              choices = c("Adelie", "Gentoo", "Chinstrap"),
              options = pickerOptions(actionsBox = TRUE),
              selected = c("Adelie", "Gentoo", "Chinstrap"),
              multiple = TRUE)
}

