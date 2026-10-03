#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import golem
#' @importFrom shinythemes shinytheme
#' @importFrom shinybusy add_busy_spinner
#' @noRd
app_ui <- function(request) {

  #get_golem_options("Olympic")
  Olympic<-OlympicRshiny::Olympic

  tagList(# Leave this function for adding external resources
    golem_add_external_resources(),

    # Your application UI logic
    fluidPage(theme = shinythemes::shinytheme("flatly"),

              shinybusy::add_busy_spinner(spin = "fading-circle"),
              # Application title
              titlePanel("OLYMPIC DATA: AN R SHINY PERSPECTIVE",windowTitle = "OlympicRshiny"),

              # sidebar which incldues the image and title, information
              sidebarLayout(
                sidebarPanel(
                  h3("Explore Olympic Games Data",align="center"),
                  br(),
                  tags$img(src='www/Olympic.png', align= "center",height='60%',width='95%'),
                  br(),
                  h4("How to Navigate OlympicRshiny",align="center"),
                  br(),
                  h5("1. Choose a country from the dropdown list."),
                  selectInput('NOC',"Choose Your Country:",
                              choices = sort(unique(stats::na.omit(Olympic$NOC))),
                              selected = "Australia",selectize = FALSE,width='100%',size = 10),
                  br(),
                  h5("2. Use the Medal Graph tab to explore medal-winning performances over time by gender."),
                  br(),
                  h5("3. Use the Top Athletes tab to explore athletes with multiple medal-winning performances at the same Olympic Games."),
                  br(),
                  h5("4. Use the Gender by Year tab to examine gender representation over time."),
                  br(),
                  h5("5. Use the Gender by Sport tab to examine gender representation across sports."),
                  br(),
                  h5("6. Use the Height & Weight by Sport tab to explore the relationship between athlete height and weight across sports and gender."),
                  br(),
                  helpText("Select different countries to explore patterns in Olympic participation, athlete characteristics, sports and medal-winning performances."),
                  br(),
                  h4("Data Source", align = "center"),
                  helpText("Olympic data are obtained from the olympicAthletes R package."),
                  br(),
                  h4("Thank You",align="center")
                ),
                # Analysis tabs
                mainPanel(
                  tags$style(type="text/css", ".shiny-output-error { visibility: hidden; }
                                               .shiny-output-error:before {
                                                visibility: visible;
                                                text-align: center;
                                                content: 'No data are available for this selection.'; }"),
                  tags$head(tags$style(".shiny-output-error{color: blue;}")),
                  tabsetPanel(type="tabs",
                              tabPanel("Swimming: Height vs Weight",plotOutput("HeightvsWeightplot")),
                              tabPanel("Top Athletes",plotOutput("TopAthleteplot")),
                              tabPanel("Medal Graph",plotOutput("Medalplot")),
                              tabPanel("Gender by Year",plotOutput("GenderBarplot")),
                              tabPanel("Gender by Sport",plotOutput("SportsBarplot")),
                              tabPanel("Height & Weight by Sport",plotOutput("HWSplot")),
                              tabPanel(title=HTML("</a></li><li><a href='https://amalan-mahendran.com/' target='_blank'>About Me"))
                              )
                          ),fluid = FALSE)
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",app_sys("app/www")#,package = "OlympicRshiny"
  )

  tags$head(
    favicon(ext="png"),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "OlympicRshiny"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
