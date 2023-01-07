library(fresh)

create_theme(
  
  # change "light-blue"/"primary" color
  adminlte_color(
    light_blue = "#150B5A" # dark blue
  ),
  
  # dashboardBody styling (includes boxes)
  adminlte_global(
    content_bg = "#E7B5B5" # blush
  ),
  
  # dashboardSidebar styling
  adminlte_sidebar(
    width = "400px", 
    dark_bg = "#57F8F3", # light blue
    dark_hover_bg = "#BF21E6", # magenta
    dark_color = "#F90000" # red
  ),
  
  # generate css file
  output_file = "shinydashboard/www/shinydashboard_fresh_theme.css"
  
)
