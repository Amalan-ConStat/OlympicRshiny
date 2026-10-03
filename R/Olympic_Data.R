#' Olympic data
#'
#' Olympic athlete-event data from 1896 onwards, including both Summer and
#' Winter Olympic Games. The data are obtained from the
#' \pkg{olympicAthletes} R package and reformatted for use in \pkg{OlympicRshiny}.
#'
#' @format A data frame with the following variables:
#' \describe{
#' \item{\code{ID}}{Unique athlete identifier.}
#' \item{\code{Name}}{Athlete's name.}
#' \item{\code{Sex}}{Sex of the athlete: Male or Female.}
#' \item{\code{Age}}{Age of the athlete in years.}
#' \item{\code{Height}}{Height of the athlete in centimeters.}
#' \item{\code{Weight}}{Weight of the athlete in kilograms.}
#' \item{\code{Team}}{Team name.}
#' \item{\code{Games}}{Olympic Games, identified by year and season.}
#' \item{\code{Year}}{Year in which the Olympic Games were held.}
#' \item{\code{Season}}{Olympic Games season: Summer or Winter.}
#' \item{\code{City}}{Host city of the Olympic Games.}
#' \item{\code{Sport}}{Sport in which the athlete participated.}
#' \item{\code{Event}}{Event in which the athlete participated.}
#' \item{\code{Medal}}{Medal won: Gold, Silver, Bronze, or \code{NA} if no medal was won.}
#' \item{\code{NOC}}{Region corresponding to the athlete's National Olympic Committee code.}
#' }
#'
#' @source The Olympic athlete-event data are obtained from the
#' \pkg{olympicAthletes} R package.
#'
#' @examples
#' plot(Olympic$Height,Olympic$Weight)
#'
"Olympic"

