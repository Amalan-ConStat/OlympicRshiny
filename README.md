
<!-- README.md is generated from README.Rmd. Please edit that file -->

# OlympicRshiny <img src="man/figures/logo.png" align="right" alt="" width="150" />

<!-- badges: start -->

[![](https://www.r-pkg.org/badges/version/OlympicRshiny)](https://cran.r-project.org/package=OlympicRshiny)
[![CRAN
checks](https://badges.cranchecks.info/summary/OlympicRshiny.svg)](https://cran.r-project.org/web/checks/check_results_OlympicRshiny.html)
[![r-universe status
badge](https://Amalan-ConStat.r-universe.dev/badges/OlympicRshiny)](https://Amalan-ConStat.r-universe.dev/OlympicRshiny)

[![](http://cranlogs.r-pkg.org/badges/grand-total/OlympicRshiny?color=green)](https://cran.r-project.org/package=OlympicRshiny)
[![](http://cranlogs.r-pkg.org/badges/last-month/OlympicRshiny?color=green)](https://cran.r-project.org/package=OlympicRshiny)
[![](http://cranlogs.r-pkg.org/badges/last-week/OlympicRshiny?color=green)](https://cran.r-project.org/package=OlympicRshiny)

[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![GitHub
issues](https://img.shields.io/github/issues/Amalan-ConStat/OlympicRshiny.svg?style=popout)](https://github.com/Amalan-ConStat/OlympicRshiny/issues)

[![](https://img.shields.io/github/languages/code-size/Amalan-ConStat/OlympicRshiny.svg)](https://github.com/Amalan-ConStat/OlympicRshiny)
[![MIT
license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)

<!-- badges: end -->

## How to engage with “OlympicRshiny” the first time ?

``` r
## Installing the package from GitHub
devtools::install_github("Amalan-ConStat/OlympicRshiny")

## Installing the package from CRAN
install.packages("OlympicRshiny")
```

Old project is at :
[Here](https://github.com/Amalan-ConStat/Olympic-Data-Rshiny-)

Old location for the Rshiny App:
[Here](https://amalan-con-stat.shinyapps.io/olympic/)

Data for the Application:
[Here](https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results)

Current Rshiny Application:
[Here](https://amalan-con-stat.shinyapps.io/OlympicRshiny/)

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
