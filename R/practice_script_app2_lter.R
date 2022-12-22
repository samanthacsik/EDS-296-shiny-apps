# NOTE: make year input into function

library(lterdatasampler)
library(tidyverse)
library(lubridate)

# GGPLOT THEME ----
myCustomTheme <- theme_light() +
  theme(#text = element_text(family = "mono"), 
    axis.text = element_text(color = "black", size = 12),
    axis.title = element_text(size = 14, face = "bold"),
    legend.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 13),
    panel.border = element_rect(colour = "black", fill = NA, linewidth = 0.7))

# ----------------------------------------

# section: 'CC' = clear cut forest & 'OG' = upstream old growth coniferous forest
# clean_coastal_sal <- and_vertebrates |>
#   filter(species == c("Coastal giant salamander")) |>
#   select(year, sampledate, section, reach, species, length = length_2_mm, weight_g, unittype) |> 
#   mutate(channel_type = case_when(
#     unittype == "C" ~ "cascade",
#     unittype == "I" ~ "riffle",
#     unittype =="IP" ~ "isolated pool",
#     unittype =="P" ~ "pool",
#     unittype =="R" ~ "rapid",
#     unittype =="S" ~ "step (small falls)",
#     unittype =="SC" ~ "side channel"
#   )) |> 
#   drop_na(snout_vent_length)

# ----------------------------------------

# --------------------
# TROUT SIZES --------
# --------------------

# section: 'CC' = clear cut forest & 'OG' = upstream old growth coniferous forest
clean_trout <- and_vertebrates |>
  filter(species == c("Cutthroat trout")) |>
  select(year, sampledate, section, reach, species, length = length_1_mm, weight_g, unittype) |> 
  mutate(channel_type = case_when(
    unittype == "C" ~ "cascade",
    unittype == "I" ~ "riffle",
    unittype =="IP" ~ "isolated pool",
    unittype =="P" ~ "pool",
    unittype =="R" ~ "rapid",
    unittype =="S" ~ "step (small falls)",
    unittype =="SC" ~ "side channel"
  )) |> 
  drop_na()


ggplot(clean_trout, aes(x = length, y = weight_g, color = channel_type)) +
  geom_point() +
  myCustomTheme

# ----------------------------------------

# clean_pikas <- nwt_pikas |> 
#   select(date, site, sex, concentration_pg_g, elev_m)
# 
# ggplot(clean_pikas, aes(x = elev_m, y = concentration_pg_g, color = site)) +
#   geom_point()
#   
# ----------------------------------------

# --------------------
# BISON SIZES --------
# --------------------

clean_bison <- knz_bison |> 
  select(year = rec_year, sex = animal_sex, animal_weight) |> 
  mutate(year = as_factor(year)) |> 
  mutate(sex = case_when(
    sex == "F" ~ "Female",
    sex == "M" ~ "Male"
  ))

ggplot(clean_bison, aes(x = animal_weight, fill = sex)) +
  geom_histogram() +
  myCustomTheme

# --------------------
# CRAB SIZES ---------
# --------------------

clean_crab <- pie_crab |> 
  mutate(year = year(date)) |> 
  select(year, latitude, size)

ggplot(pie_crab, aes(x = size, y = latitude, color = latitude)) +
  geom_point()
