library(fresh)

create_theme(
  
  # you can supply a bootstrap theme to begin with
  theme = "default",

  # global styling
  bs_vars_global(
    body_bg = "#D2D0CA",
    text_color = "#F23ACB",
    link_color = "#0E4BE3"
  ),

  bs_vars_navbar(
    default_bg = "#13CC13",
    default_color = "#66656C"
  ),

  # # sidebarPanel
  # bs_vars_wells(
  #   bg = "#FFF",
  #   border = "#3f2d54"
  # ),

  # tabPanels
  bs_vars_tabs(
    border_color = "#F90909"
  ),

  # generate css file
  output_file = "two-file-app/www/shiny_fresh_theme.css"
)
