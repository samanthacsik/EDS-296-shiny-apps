#..........................load packages.........................
library(palmerpenguins)
library(tidyverse)
library(DT)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                            penguin scatterplot                           ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# create widget to filter for range of penguin body masses

#...............practice filtering for body masses...............
body_mass_df <- penguins |> 
  filter(body_mass_g %in% 3000:4000)

#...................plot filtered penguin data...................
ggplot(na.omit(body_mass_df), 
       aes(x = flipper_length_mm, y = bill_length_mm, 
           color = species, shape = species)) +
  geom_point() +
  scale_color_manual(values = c("Adelie" = "#FEA346", "Chinstrap" = "#B251F1", "Gentoo" = "#4BA4A4")) +
  scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
  labs(x = "Flipper length (mm)", y = "Bill length (mm)", 
       color = "Penguin species", shape = "Penguin species") +
  theme_minimal() +
  theme(legend.position = c(0.85, 0.2),
        legend.background = element_rect(color = "white"))

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                            penguin DT datatable                          ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# create widget to select years

#..................practice filtered for years...................
years_df <- penguins |> 
  filter(year %in% c("2007", "2008"))

#......................create DT datatable.......................
DT::datatable(years_df,
              options = list(pagelength = 10),
              rownames = FALSE)
