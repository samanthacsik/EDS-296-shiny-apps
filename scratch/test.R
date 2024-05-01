data <- read_csv(here::here("raw_data", "my-test-data.csv"))

# count number of rows ----
total_rows <- nrow(data)

# count number of rows with NAs
total_NA_rows <- data |> 
  filter(if_any(everything(), is.na)) |> 
  count()
