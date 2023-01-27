#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom summarytools dfSummary
#' @noRd
app_server <- function(input, output, session) {
  # creating the plots
  output$plot <- renderPlot({

    Medal_color<-c("#CD7F32","#FFD700","#C0C0C0")
    names(Medal_color)<-levels(factor(Olympic$Medal))

    if(input$NoNA == FALSE)
    {
      subset(Olympic,NOC==input$NOC) %>%
        ggplot2::ggplot(.,ggplot2::aes(x=Season,y=Sex,color=factor(Medal)))+
        ggplot2::geom_jitter()+ggplot2::facet_wrap(~factor(Year),ncol = 4)+
        ggplot2::xlab("Years of Participation")+
        ggplot2::ylab("Gender")+
        ggplot2::scale_color_manual(name="Medal",values=Medal_color,na.value="red") +
        ggplot2::ggtitle("MEDALS WON OVER THE YEARS ACCORDING TO GENDER")+
        ggplot2::theme_bw()
    }
    else
    {
      subset(Olympic[!is.na(Olympic$Medal),],NOC==input$NOC) %>%
        ggplot2::ggplot(.,ggplot2::aes(x=Season,y=Sex,color=factor(Medal)))+
        ggplot2::geom_jitter()+ggplot2::facet_wrap(~factor(Year),ncol=4)+
        ggplot2::xlab("Years of Participation")+
        ggplot2::ylab("Gender")+
        ggplot2::scale_color_manual(name="Medal",values=Medal_color,na.value="red") +
        ggplot2::ggtitle("MEDALS WON OVER THE YEARS ACCORDING TO GENDER")+
        ggplot2::theme_bw()

    }
  },height = 1400,width = 1200)

  # creating the table
  output$table<-DT::renderDataTable({
    DT::datatable(subset(Olympic,NOC==input$NOC,
                         select = -c(Height,Weight,Team,NOC,Games,City,Sport)),
                  options = list(pageLength= 30))
  })
  # creating the summary for selected variables
  output$summary<-renderUI({
    print(summarytools::dfSummary(subset(Olympic,NOC==input$NOC,
                                         select =c(Sex,Age,Height,Weight,Year,Season,Sport,Medal))
    ),method = 'render',headings = FALSE, bootstracp.css = FALSE)
  })

  # Gender Count over the year
  output$barplot <- renderPlot({
    Gender_color<-c("#DEA1C0","#6BA5DE")
    names(Gender_color)<-levels(factor(Olympic$Sex))

    subset(Olympic,NOC==input$NOC,select = c(Sex,Year,Season)) %>%
      ggplot2::ggplot(.,ggplot2::aes(x=factor(Year),fill=factor(Sex),group=factor(Sex)))+
      ggplot2::geom_bar(position = "dodge")+
      ggplot2::xlab("Years")+ggplot2::ylab("Frequency")+
      ggplot2::coord_flip()+ggplot2::labs(fill="Gender")+
      ggplot2::scale_fill_manual(name="Gender",values=Gender_color) +
      ggplot2::ggtitle("GENDER RELATED PARTICIPATION OVER THE YEARS")+
      ggplot2::geom_text(stat='count',ggplot2::aes(y=..count..,label=..count..),
                         position=ggplot2::position_dodge(width = 1),hjust=1.25,
                         color="#696969",size=4) +
      ggplot2::theme_bw() },height = 1400,width = 1200)

  # Gender Count for Sports
  output$SportsBarplot<-renderPlot({
    Gender_color<-c("#DEA1C0","#6BA5DE")
    names(Gender_color)<-levels(factor(Olympic$Sex))

    subset(Olympic,NOC==input$NOC,select = c(Sex,Sport,Season)) %>%
      ggplot2::ggplot(.,ggplot2::aes(x=forcats::fct_infreq(factor(Sport)),fill=factor(Sex),group=factor(Sex)))+
      ggplot2::geom_bar(position = "dodge")+
      ggplot2::xlab("Sport")+ggplot2::ylab("Frequency")+ggplot2::coord_flip()+
      ggplot2::labs(fill="Gender")+
      ggplot2::scale_fill_manual(name="Gender",values=Gender_color)+
      ggplot2::ggtitle("GENDER REPRESENTATION IN SPORTS OF PARTICIPANTS")+
      ggplot2::geom_text(stat='count',ggplot2::aes(y=..count..,label=..count..),
                position=ggplot2::position_dodge(width = 1),hjust=1.25,
                color="#696969",size=3) +
      ggplot2::theme_bw() },height = 1400,width = 1200)

  # Scatter plot for height, Sports and Years with gender
  output$HWSplot<-renderPlot({
    Gender_color<-c("#DEA1C0","#6BA5DE")
    names(Gender_color)<-levels(factor(Olympic$Sex))

    subset(Olympic,NOC==input$NOC,select = c(Height,Weight,Sport,Sex)) %>%
      ggplot2::ggplot(.,ggplot2::aes(x=Weight,y=Height,color=factor(Sex)))+
      ggplot2::geom_point()+
      ggplot2::ggtitle("HEIGHT AND WEIGHT OF PARTICIPANTS BASED ON SPORTS")+
      ggplot2::labs(color="Gender")+ggplot2::xlab("Weight (kg)")+ggplot2::ylab("Height (cm)")+
      ggplot2::facet_wrap(~Sport,ncol = 4)+
      ggplot2::scale_color_manual(name="Gender",values=Gender_color) +
      ggplot2::theme_bw() },height = 1400,width = 1200)
}
