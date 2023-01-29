#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom shinythemes shinytheme
#' @importFrom shinybusy add_busy_spinner
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(theme = shinythemes::shinytheme("flatly"),

              shinybusy::add_busy_spinner(spin = "fading-circle"),
              # Application title
              titlePanel("OLYMPIC DATA FROM KAGGLE : AN RSHINY PERSPECTIVE",windowTitle = "Olympic : Rshiny"),

              # sidebar which incldues the image and title, information
              sidebarLayout(
                sidebarPanel(
                  h3("Olympic & Countries From 1896 Until 2016",align="center"),
                  br(),
                  tags$img(src='www/Olympic.png', align= "center",height='60%',width='95%'),
                  br(),
                  h4("How to Navigate the Olympic Rshiny App",align="center"),
                  br(),
                  h5("1. Choose your country by the dropdown list"),
                  selectInput('NOC',"Choose Your Country:",
                              choices = sort(unique(Olympic$NOC)),
                              selected = "Australia",selectize = FALSE,width='400px',size = 10),
                  br(),
                  h5("2. Click on *MEDAL GRAPH* tab to see how the medals were won for each year for the chosen country with respective to Gender."),
                  br(),
                  h5("3. Show the data of the chosen country using *TOP Athlete* tab."),
                  br(),
                  h5("4. Print a Summary Table of the chosen country using the *DESCRIBE* tab."),
                  br(),
                  h5("5. Use *G/Years* tab to understand how Gender representation has changed over
                     the years of participation for the chosen country."),
                  br(),
                  h5("6. Use *S/Years* to understand how Gender representation has changed over
                     sports participated by the attendees for the chosen country."),
                  br(),
                  h5("7. Finally, Use the *H/W/Sport* tab to explore how participants
                     Height and Weight relationship for each Sporting event with respective
                     to gender for the chosen country."),
                  br(),
                  helpText("*Do the above steps for different countries and observe them for your amusement.*"),
                  br(),
                  h4("Thank You",align="center")
                ),
                # tabs for 4 types
                mainPanel(
                  tags$style(type="text/css", ".shiny-output-error { visibility: hidden; }
                                               .shiny-output-error:before {
                                                visibility: visible;
                                                text-align: center;
                                                content: 'The Country you have chosen has not won any medals.'; }
                                                }"),
                  tags$head(tags$style(".shiny-output-error{color: blue;}")),
                  tabsetPanel(type="tabs",
                              tabPanel("HEIGHT VS WEIGHT",plotOutput("HeightvsWeightplot")),
                              tabPanel("TOP ATHLETE",plotOutput("TopAthleteplot")),
                              tabPanel("DESCRIBE",htmlOutput("summary")),
                              tabPanel("MEDAL GRAPH",plotOutput("Medalplot")),
                              tabPanel("G/Years",plotOutput("GenderBarplot")),
                              tabPanel("S/Years",plotOutput("SportsBarplot")),
                              tabPanel("H/W/Sport",plotOutput("HWSplot")),
                              tabPanel(title=HTML("</a></li><li><a href='https://amalan-con-stat.netlify.com/' target='_blank'>About Me"))
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
    "www",system.file("app/www",package = "OlympicRshiny")
  )

  tags$head(
    favicon(ext="png"),
    bundle_resources(
      path = system.file("app/www"),
      app_title = "OlympicRshiny"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
