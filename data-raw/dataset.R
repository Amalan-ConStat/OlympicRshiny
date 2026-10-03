# Prepare Olympic dataset
# NOC lookup table
NOC <- read.csv("data-raw/noc_regions.csv")

# Prepare Olympic data
Olympic <- olympicAthletes::olympic_athletes |>
  dplyr::select(id,name, sex, age, height, weight, team, noc, games,
                year, season, city_english, sport, event, medal) |>
  dplyr::rename(ID = id,Name = name, Sex = sex, Age = age, Height = height,
                Weight = weight, Team = team, NOC = noc, Games = games,
                Year = year, Season = season, City = city_english,
                Sport = sport, Event = event, Medal = medal) |>
  dplyr::left_join(NOC, by = "NOC") |>
  dplyr::select(-NOC) |>
  dplyr::rename(NOC = region) |>
  dplyr::mutate(Sex = factor(Sex, levels = c("M", "F"),
                             labels = c("Male", "Female")),
                Medal = factor(Medal, levels = c("Gold", "Silver", "Bronze"))) |>
  dplyr::select(-notes)

# Save dataset
usethis::use_data(Olympic, overwrite = TRUE, compress = "xz")
