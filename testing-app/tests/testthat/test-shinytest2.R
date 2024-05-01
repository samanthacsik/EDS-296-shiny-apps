library(shinytest2)

test_that("{shinytest2} recording: one-name-greeting", {
  app <- AppDriver$new(name = "one-name-greeting", height = 754, width = 1137)
  app$set_inputs(name_input = "Sam")
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
})


test_that("{shinytest2} recording: consecutive-name-greeting", {
  app <- AppDriver$new(name = "consecutive-name-greeting", height = 754, width = 1137)
  app$set_inputs(name_input = "Sam")
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
  app$set_inputs(name_input = "Kat")
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
})


test_that("{shinytest2} recording: no-name-greeting", {
  app <- AppDriver$new(name = "no-name-greeting", height = 754, width = 1137)
  app$click("greeting_button_input")
  app$expect_values(output = "greeting_output")
})


test_that("{shinytest2} recording: upload-cols-and-data", {
  app <- AppDriver$new(name = "upload-cols-and-data", height = 754, width = 1137)
  app$upload_file(csv_input = "cols-and-data1.csv")
  app$expect_values(output = "summary_table_output")
})


test_that("{shinytest2} recording: upload-incorrect-cols", {
  app <- AppDriver$new(name = "upload-incorrect-cols", height = 754, width = 1137)
  app$upload_file(csv_input = "incorrect-cols.csv")
  app$expect_values(output = "summary_table_output")
})


test_that("{shinytest2} recording: upload-empty-csv", {
  app <- AppDriver$new(name = "upload-empty-csv", height = 754, width = 1137)
  app$upload_file(csv_input = "empty.csv")
  app$expect_values(output = "summary_table_output")
})


test_that("{shinytest2} recording: upload-only-cols", {
  app <- AppDriver$new(name = "upload-only-cols", height = 754, width = 1137)
  app$upload_file(csv_input = "only-cols.csv")
  app$expect_values(output = "summary_table_output")
})


test_that("{shinytest2} recording: upload-only-data", {
  app <- AppDriver$new(name = "upload-only-data", height = 754, width = 1137)
  app$upload_file(csv_input = "only-data.csv")
  app$expect_values(output = "summary_table_output")
})


test_that("{shinytest2} recording: upload-consecutive-correct-files", {
  app <- AppDriver$new(name = "upload-consecutive-correct-files", height = 754, width = 1137)
  app$upload_file(csv_input = "cols-and-data1.csv")
  app$expect_values(output = "summary_table_output")
  app$upload_file(csv_input = "cols-and-data2.csv")
  app$expect_values(output = "summary_table_output")
})


test_that("{shinytest2} recording: select-three-spp", {
  app <- AppDriver$new(name = "select-three-spp", height = 754, width = 1137)
  app$expect_values(output = "scatterplot_output")
})


test_that("{shinytest2} recording: deselect-adelie", {
  app <- AppDriver$new(name = "deselect-adelie", height = 754, width = 1137)
  app$set_inputs(penguinSpp_scatterplot_input_open = TRUE, allow_no_input_binding_ = TRUE)
  app$set_inputs(penguinSpp_scatterplot_input = c("Chinstrap", "Gentoo"))
  app$expect_values(output = "scatterplot_output")
  app$set_inputs(penguinSpp_scatterplot_input_open = FALSE, allow_no_input_binding_ = TRUE)
})


test_that("{shinytest2} recording: consecutive-spp-selections", {
  app <- AppDriver$new(name = "consecutive-spp-selections", height = 754, width = 1137)
  app$set_inputs(penguinSpp_scatterplot_input_open = TRUE, allow_no_input_binding_ = TRUE)
  app$set_inputs(penguinSpp_scatterplot_input = character(0))
  app$expect_values(output = "scatterplot_output")
  app$set_inputs(penguinSpp_scatterplot_input_open = FALSE, allow_no_input_binding_ = TRUE)
  app$set_inputs(penguinSpp_scatterplot_input_open = TRUE, allow_no_input_binding_ = TRUE)
  app$set_inputs(penguinSpp_scatterplot_input = "Gentoo")
  app$expect_values(output = "scatterplot_output")
  app$set_inputs(penguinSpp_scatterplot_input_open = FALSE, allow_no_input_binding_ = TRUE)
  app$set_inputs(penguinSpp_scatterplot_input_open = TRUE, allow_no_input_binding_ = TRUE)
  app$set_inputs(penguinSpp_scatterplot_input = c("Adelie", "Chinstrap", "Gentoo"))
  app$expect_values(output = "scatterplot_output")
  app$set_inputs(penguinSpp_scatterplot_input_open = FALSE, allow_no_input_binding_ = TRUE)
})


test_that("{shinytest2} recording: default-app-state", {
  app <- AppDriver$new(name = "default-app-state", height = 754, width = 1137)
  app$expect_values()
})
