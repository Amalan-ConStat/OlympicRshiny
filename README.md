
<!-- README.md is generated from README.Rmd. Please edit that file -->

# OlympicRshiny <img src="man/figures/logo.png" align="right" alt="" width="150" />

<!-- badges: start -->

[![packageversion](https://img.shields.io/badge/Package%20version-1.0.0-orange.svg?style=flat-square)](commits/main)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![MIT
license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)
[![Codecov test
coverage](https://codecov.io/gh/Amalan-ConStat/OlympicRshiny/branch/main/graph/badge.svg)](https://app.codecov.io/gh/Amalan-ConStat/OlympicRshiny?branch=main)
<!-- badges: end -->

## How to engage with “OlympicRshiny” the first time ?

``` r
## Installing the package from GitHub
devtools::install_github("Amalan-ConStat/OlympicRshiny")

## Installing the package from CRAN
install.packages("OlympicRshiny")
```

Old project is at :
<https://github.com/Amalan-ConStat/Olympic-Data-Rshiny->

Old location for the Rshiny App:
<https://amalan-con-stat.shinyapps.io/olympic/>

Data for the Application:
<https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results>

## Why I choose Rshiny than a blog post ?

- Convenience.
- Attractive.
- Simple.
- No Intention of Comparison between countries or players.

## What does this Rshiny App does ?

### Tabs

- GRAPH - Plot indicating the medals wons over the years for a chosen
  country.
- DATA - For a chosen country the data is acquired.
- DESCRIBE - Summary of the chosen country in an interactive table.
- G/YEARS - For a chosen country a bar plot indicating how Gender
  representation changes over year.
- S/YEARS - For a chosen country a bar plot indicating how Gender
  representation changes over sport.
