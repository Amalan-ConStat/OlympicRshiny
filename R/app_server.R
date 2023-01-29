#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom summarytools dfSummary
#' @noRd
app_server <- function(input, output, session) {

  output$HeightvsWeightplot<-renderPlot({
    Medal_color<-c("#FFD700","#C0C0C0","#CD7F32")
    names(Medal_color)<-levels(c("Gold","Silver","Bronze"))

    ggplot2::ggplot(Olympic[!is.na(Olympic$Height) & !is.na(Olympic$Weight) & !is.na(Olympic$Medal) & Olympic$Sport %in% "Swimming",],
                    ggplot2::aes(x=Height,y=Weight,color=Medal))+
      ggplot2::geom_point(alpha=0.5)+ggplot2::scale_color_manual(name="Medal",values=Medal_color) +
      ggplot2::facet_wrap(~Event, labeller = ggplot2::labeller(Event = ggplot2::label_wrap_gen(25)))+
      ggplot2::xlab("Height (cm)")+ggplot2::ylab("Weight (kg)")+
      ggplot2::ggtitle("SWIMMING EVENTS HEIGHT AND WEIGHT ")+ggplot2::theme_bw()},height = 1500,width = 1200)

  # creating Top Athlete Plot
  output$TopAthleteplot<-renderPlot({
    Medal_color<-c("#FFD700","#C0C0C0","#CD7F32")
    names(Medal_color)<-levels(c("Gold","Silver","Bronze"))

    Olympic[!is.na(Olympic$Medal),] |>
      dplyr::count(Year,Name,NOC,Sport,Medal,sort = TRUE) |>
      subset(n>= 3)->Top_Performance_Data

    ggplot2::ggplot(Top_Performance_Data,ggplot2::aes(x=factor(Year),y=factor(Sport),size=n,color=Medal))+
      ggplot2::geom_jitter()+ggplot2::xlab("Year")+ggplot2::ylab("Sports")+
      ggplot2::facet_wrap(~factor(NOC))+
      ggplot2::scale_color_manual(name="Medal",values=Medal_color)+
      ggplot2::ggtitle("SPORTS VS COUNTRIES OF ALL MEDALS")+
      ggplot2::theme_bw()+
      ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, vjust = 0.25, hjust=0.25))},height = 1500,width = 1200)

  # creating the summary for selected variables
  output$summary<-renderUI({
    print(summarytools::dfSummary(subset(Olympic,NOC==input$NOC,
                                         select =c(Sex,Age,Height,Weight,Year,Season,Sport,Medal))
    ),method = 'render',headings = FALSE, bootstracp.css = FALSE)})

  # creating the Medalplot
  output$Medalplot <- renderPlot({
    Medal_color<-c("#FFD700","#C0C0C0","#CD7F32")
    names(Medal_color)<-levels(c("Gold","Silver","Bronze"))

    ggplot2::ggplot(subset(Olympic[!is.na(Olympic$Medal),],NOC==input$NOC) |>
                      dplyr::group_by(Year,Season,Sex,Medal) |>
                      dplyr::count(Year,Season,Sex,Medal),
                    ggplot2::aes(x=factor(Year),y=n,color=factor(Medal),group=factor(Medal)))+
      ggplot2::geom_point(size=3)+ggplot2::geom_line()+
      ggplot2::facet_grid(factor(Season)~factor(Sex),scales = "free")+
      ggplot2::xlab("Years of Participation")+ggplot2::ylab("No of Medals")+
      ggplot2::scale_color_manual(name="Medal",values=Medal_color)+
      ggplot2::ggtitle("MEDALS WON OVER THE YEARS ACCORDING TO GENDER")+
      ggplot2::theme_bw()+
      ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 60, vjust = 0.25, hjust=0.25))},height = 1500,width = 1200)

  # Gender Count over the year
  output$GenderBarplot <- renderPlot({
    Gender_color<-c("#6BA5DE","#DEA1C0")
    names(Gender_color)<-levels(c("Male","Female"))

    ggplot2::ggplot(subset(Olympic,NOC==input$NOC,select = c(Sex,Year,Season)),
                    ggplot2::aes(x=factor(Year),fill=factor(Sex),group=factor(Sex)))+
      ggplot2::geom_bar(position = "dodge")+
      ggplot2::xlab("Years")+ggplot2::ylab("Frequency")+
      ggplot2::coord_flip()+ggplot2::labs(fill="Gender")+
      ggplot2::scale_fill_manual(name="Gender",values=Gender_color) +
      ggplot2::ggtitle("GENDER RELATED PARTICIPATION OVER THE YEARS")+
      ggplot2::geom_text(stat='count',ggplot2::aes(y=ggplot2::after_stat(count),
                                                   label=ggplot2::after_stat(count)),
                         position=ggplot2::position_dodge(width = 1),hjust=1.25,
                         color="#696969",size=4) +
      ggplot2::theme_bw() },height = 1500,width = 1200)

  # Gender Count for Sports
  output$SportsBarplot<-renderPlot({
    Gender_color<-c("#6BA5DE","#DEA1C0")
    names(Gender_color)<-levels(c("Male","Female"))

    ggplot2::ggplot(subset(Olympic,NOC==input$NOC,select = c(Sex,Sport,Season)),
                    ggplot2::aes(x=forcats::fct_infreq(factor(Sport)),fill=factor(Sex),group=factor(Sex)))+
      ggplot2::geom_bar(position = "dodge")+
      ggplot2::xlab("Sport")+ggplot2::ylab("Frequency")+ggplot2::coord_flip()+
      ggplot2::labs(fill="Gender")+
      ggplot2::scale_fill_manual(name="Gender",values=Gender_color)+
      ggplot2::ggtitle("GENDER REPRESENTATION IN SPORTS OF PARTICIPANTS")+
      ggplot2::geom_text(stat='count',ggplot2::aes(y=ggplot2::after_stat(count),
                                                   label=ggplot2::after_stat(count)),
                         position=ggplot2::position_dodge(width = 1),hjust=1.25,
                         color="#696969",size=3) +
      ggplot2::theme_bw() },height = 1500,width = 1200)

  # Scatter plot for height, Sports and Years with gender
  output$HWSplot<-renderPlot({
    Gender_color<-c("#6BA5DE","#DEA1C0")
    names(Gender_color)<-levels(c("Male","Female"))

    ggplot2::ggplot(subset(Olympic,NOC==input$NOC,select = c(Height,Weight,Sport,Sex)),
                    ggplot2::aes(x=Weight,y=Height,color=factor(Sex)))+
      ggplot2::geom_point()+
      ggplot2::ggtitle("HEIGHT AND WEIGHT OF PARTICIPANTS BASED ON SPORTS")+
      ggplot2::labs(color="Gender")+ggplot2::xlab("Weight (kg)")+ggplot2::ylab("Height (cm)")+
      ggplot2::facet_wrap(~Sport,ncol = 4)+
      ggplot2::scale_color_manual(name="Gender",values=Gender_color) +
      ggplot2::theme_bw() },height = 1500,width = 1200)
}
