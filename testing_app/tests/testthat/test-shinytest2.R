library(shinytest2)

test_that("{shinytest2} recording: sam-test", {
  app <- AppDriver$new(name = "sam-test", height = 509, width = 657)
  app$set_inputs(name = "Sam")
  app$click("greet")
  app$expect_values()
})

