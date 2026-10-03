#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import golem
#' @import ggplot2
#' @noRd
app_server <- function(input, output, session) {

  #get_golem_options("Olympic")
  Olympic<-OlympicRshiny::Olympic

  Medal_color <- c(Gold = "#FFD700",Silver = "#C0C0C0",Bronze = "#CD7F32")
  Gender_color <- c(Male = "#6BA5DE",Female = "#DEA1C0")

  Input_NOC<-reactive({ input$NOC })

  # Swimming height and weight ----
  output$HeightvsWeightplot <- renderPlot({

    Swimming_Data <- Olympic |>
      dplyr::filter(!is.na(Height),!is.na(Weight),!is.na(Medal),Sport == "Swimming") |>
      dplyr::distinct(ID, Year, Event, Medal, Height, Weight, .keep_all = TRUE)

    ggplot2::ggplot(Swimming_Data,ggplot2::aes(x = Height, y = Weight, color = Medal)) +
      ggplot2::geom_point(alpha = 0.5) +
      ggplot2::scale_color_manual(name = "Medal", values = Medal_color) +
      ggplot2::facet_wrap(~Event,labeller = ggplot2::labeller(Event = ggplot2::label_wrap_gen(25))) +
      ggplot2::labs(title = "HEIGHT AND WEIGHT OF SWIMMING MEDALISTS",
                    x = "Height (cm)", y = "Weight (kg)") + ggplot2::theme_bw()
  }, height = 1500, width = 1200)

  # Top athlete performances ----
  # Top athlete performances ----
  output$TopAthleteplot <- renderPlot({

    req(Input_NOC())

    Top_Performance_Data <- Olympic |>
      dplyr::filter(NOC == Input_NOC(), !is.na(Medal)) |>
      dplyr::group_by(ID, Year, Name, Sport) |>
      dplyr::summarise(Medals = dplyr::n(), .groups = "drop") |>
      dplyr::filter(.data$Medals >= 3)

    ggplot2::ggplot(Top_Performance_Data,
      ggplot2::aes(x = factor(Year),y = forcats::fct_reorder(Name, Medals, .fun = max),
        size = Medals)) +
      ggplot2::geom_point(alpha = 0.7) + ggplot2::facet_wrap(~Sport, scales = "free_y") +
      ggplot2::scale_size_continuous(name = "Medal-Winning\nPerformances") +
      ggplot2::labs(title = paste("TOP OLYMPIC ATHLETES FROM", toupper(Input_NOC())),
        subtitle = "Athletes with at least three medal-winning performances in a sport at the same Games",
        x = "Year", y = "Athlete") +
      ggplot2::theme_bw() +
      ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, vjust = 0.5, hjust = 1))

  }, height = 1500, width = 1200)

  # Medal-winning performances ----
  output$Medalplot <- renderPlot({

    req(Input_NOC())

    Medal_Data <- Olympic |>
      dplyr::filter(NOC == Input_NOC(),!is.na(Medal)) |>
      dplyr::count(Year, Season, Sex, Medal)

    ggplot2::ggplot(Medal_Data,
      ggplot2::aes(x = factor(Year),y = n,color = Medal,group = Medal)) +
      ggplot2::geom_point(size = 3) + ggplot2::geom_line() +
      ggplot2::facet_grid(Season ~ Sex, scales = "free") +
      ggplot2::scale_color_manual(name = "Medal", values = Medal_color) +
      ggplot2::labs(title = "MEDAL-WINNING PERFORMANCES OVER THE YEARS BY GENDER",
        x = "Years of Participation", y = "Medal-Winning Athlete Records") +
      ggplot2::theme_bw() +
      ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60,vjust = 0.25,hjust = 0.25))

  }, height = 1500, width = 1200)

  # Gender participation over time ----
  output$GenderBarplot <- renderPlot({

    req(Input_NOC())

    Gender_Data <- Olympic |>
      dplyr::filter(NOC == Input_NOC()) |>
      dplyr::distinct(ID, Year, Season, Sex)

    ggplot2::ggplot(Gender_Data,ggplot2::aes(x = factor(Year), fill = Sex)) +
      ggplot2::geom_bar(position = "dodge") +
      ggplot2::geom_text(stat = "count",
                         ggplot2::aes(y = ggplot2::after_stat(count),
                                      label = ggplot2::after_stat(count)),
                         position = ggplot2::position_dodge(width = 1),
                         hjust = 1.25,color = "#696969",size = 4) +
      ggplot2::coord_flip() +
      ggplot2::scale_fill_manual(name = "Gender", values = Gender_color) +
      ggplot2::labs(title = "GENDER REPRESENTATION OVER THE YEARS",
                    x = "Year", y = "Number of Athletes") +
      ggplot2::theme_bw()

  }, height = 1500, width = 1200)

  # Gender representation by sport ----
  output$SportsBarplot <- renderPlot({

    req(Input_NOC())

    Sport_Data <- Olympic |>
      dplyr::filter(NOC == Input_NOC()) |>
      dplyr::distinct(ID, Year, Season, Sport, Sex)

    ggplot2::ggplot(Sport_Data,ggplot2::aes(x = forcats::fct_infreq(factor(Sport)),fill = Sex)) +
      ggplot2::geom_bar(position = "dodge") +
      ggplot2::geom_text(stat = "count",
                         ggplot2::aes(y = ggplot2::after_stat(count),label = ggplot2::after_stat(count)),
                         position = ggplot2::position_dodge(width = 1),
                         hjust = 1.25, color = "#696969", size = 3) +
      ggplot2::coord_flip() +
      ggplot2::scale_fill_manual(name = "Gender", values = Gender_color) +
      ggplot2::labs(title = "GENDER REPRESENTATION ACROSS SPORTS",
                    x = "Sport", y = "Athlete Participations") +
      ggplot2::theme_bw()

  }, height = 1500, width = 1200)

  # Height and weight by sport ----
  output$HWSplot <- renderPlot({

    req(Input_NOC())

    HW_Data <- Olympic |>
      dplyr::filter(NOC == Input_NOC(),!is.na(Height),!is.na(Weight),!is.na(Sex)) |>
      dplyr::distinct(ID, Year, Sport, Sex, Height, Weight)

    ggplot2::ggplot(HW_Data,ggplot2::aes(x = Weight,y = Height,color = Sex)) +
      ggplot2::geom_point() + ggplot2::facet_wrap(~Sport, ncol = 4) +
      ggplot2::scale_color_manual(name = "Gender", values = Gender_color) +
      ggplot2::labs(title = "HEIGHT AND WEIGHT OF PARTICIPANTS BASED ON SPORTS",
        x = "Weight (kg)", y = "Height (cm)") + ggplot2::theme_bw()

  }, height = 1500, width = 1200)
}
