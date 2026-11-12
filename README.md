
<!-- README.md is generated from README.Rmd. Please edit that file -->

# OlympicRshiny <img src="man/figures/logo.png" align="right" alt="" width="150" />

<!-- badges: start -->

[![](https://www.r-pkg.org/badges/version/OlympicRshiny)](https://cran.r-project.org/package=OlympicRshiny)
[![CRAN
checks](https://badges.cranchecks.info/summary/OlympicRshiny.svg)](https://cran.r-project.org/web/checks/check_results_OlympicRshiny.html)
[![r-universe status
badge](https://Amalan-ConStat.r-universe.dev/badges/OlympicRshiny)](https://Amalan-ConStat.r-universe.dev/OlympicRshiny)
[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![MIT
license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)

[![](http://cranlogs.r-pkg.org/badges/grand-total/OlympicRshiny?color=green)](https://cran.r-project.org/package=OlympicRshiny)
[![](http://cranlogs.r-pkg.org/badges/last-month/OlympicRshiny?color=green)](https://cran.r-project.org/package=OlympicRshiny)
[![](http://cranlogs.r-pkg.org/badges/last-week/OlympicRshiny?color=green)](https://cran.r-project.org/package=OlympicRshiny)
[![GitHub
issues](https://img.shields.io/github/issues/Amalan-ConStat/OlympicRshiny.svg?style=popout)](https://github.com/Amalan-ConStat/OlympicRshiny/issues)
[![](https://img.shields.io/github/languages/code-size/Amalan-ConStat/OlympicRshiny.svg)](https://github.com/Amalan-ConStat/OlympicRshiny)

<!-- badges: end -->

## OlympicRshiny

`OlympicRshiny` is an R package containing a Shiny application for
exploring historical Olympic athlete-event data from 1896 onwards,
covering both Summer and Winter Olympic Games.

The application provides interactive visualisations of Olympic
participation, medal-winning performances, gender representation,
sports, and athlete characteristics. Users can select a country and
explore how its Olympic participation has changed across Games and
sports.

The Olympic athlete-event data used by the application are obtained from
the `olympicAthletes` R package and reformatted for use within
`OlympicRshiny`.

## Installation

The development version can be installed from GitHub:

``` r
devtools::install_github("Amalan-ConStat/OlympicRshiny")
```

The released version can be installed from CRAN:

``` r
install.packages("OlympicRshiny")
```

After installation, launch the application using:

``` r
library(OlympicRshiny)
run_app()
```

## Shiny Application

The current version of the application is available on shinyapps.io:

[OlympicRshiny](https://amalan-con-stat.shinyapps.io/OlympicRshiny/)

The original version of the project is archived here:

[Original Olympic Data R Shiny
Project](https://github.com/Amalan-ConStat/Olympic-Data-Rshiny-)

## Data

The application uses Olympic athlete-event data from the
`olympicAthletes` R package.

The data are processed and stored within `OlympicRshiny` as the
`Olympic` dataset. National Olympic Committee codes are mapped to
corresponding country or region names for use throughout the
application.

The processed dataset includes athlete identifiers, demographic
characteristics, Olympic Games information, sports and events, and
medal-winning performances.

## What does the Shiny application provide?

### Swimming: Height vs Weight

Explore the relationship between height and weight among medal-winning
Olympic swimmers across swimming events. Points are distinguished by
medal type.

### Top Athletes

Explore athletes from the selected country with at least three
medal-winning performances within a sport at the same Olympic Games.
Athlete names are displayed against Olympic year, with point size
representing the number of medal-winning performances.

### Medal Graph

Explore medal-winning athlete-event records for the selected country
over time. Results are displayed by medal type, gender, and Olympic
season.

### Gender by Year

Explore changes in gender representation among Olympic athletes from the
selected country over time. Athletes participating in multiple events at
the same Games are counted once.

### Gender by Sport

Explore gender representation across sports for the selected country.
Athletes participating in multiple events within the same sport at the
same Games are counted once for that sport.

### Height & Weight by Sport

Explore the relationship between athlete height and weight across sports
and gender for the selected country. Repeated event-level observations
are removed so that athletes competing in multiple events within the
same sport and Games are not unnecessarily duplicated.

## Purpose

`OlympicRshiny` provides a simple interactive environment for exploring
patterns in historical Olympic data. The application is intended
primarily for exploratory and descriptive visualisation rather than
formal comparisons or rankings of countries or athletes.
