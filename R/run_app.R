#' Run the Shiny Application
#'
#' @param ... list of golem options.
#'
#' @return used for side effects
#'
#' @export
#' @importFrom shiny shinyApp
#' @importFrom golem with_golem_options
run_app <- function(
  #onStart = NULL,
  #options = list(),
  #enableBookmarking = NULL,
  #uiPattern = "/",
  ...
) {
  with_golem_options(
    app = shinyApp(
      ui = app_ui,
      server = app_server#,
      #onStart = onStart,
      #options = options,
      #enableBookmarking = enableBookmarking,
      #uiPattern = uiPattern
    ),
    #golem_opts = list(...)
    golem_opts = list(Olympic=OlympicRshiny::Olympic)
  )
}
