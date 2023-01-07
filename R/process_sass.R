library(sass)

sass(
  sass_file("R/my_sass_styles.scss"),
  #cache_options = sass_cache_options(FALSE),
  options = sass_options(output_style = "compressed"),
  output = "two-file-app/www/my_sass_styles.css"
)
