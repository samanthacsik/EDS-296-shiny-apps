# https://community.rstudio.com/t/navigate-inputpicker-list-with-arrow-keys/71101/2

(require(shiny))
(require(shinyjs))
(require(V8))
jscode <- "
shinyjs.init = function() {
  $(document).keypress(function(e) { alert('Key pressed: ' + e.which); });
}"

shinyApp(
  ui = fluidPage(
    useShinyjs(),
    extendShinyjs(text = jscode),
    "Press any key"
  ),
  server = function(input, output) {}
)
# combine UI & server into an app ----
shinyApp(ui = ui, server = server)