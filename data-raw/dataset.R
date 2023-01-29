## code to prepare `dataset` dataset goes here
load("data-raw/Olympic.RDA")

NOC[is.na(NOC$region) & !is.na(NOC$notes),2]<-NOC[is.na(NOC$region) & !is.na(NOC$notes),3]

Olympic$NOC<-factor(Olympic$NOC,levels = NOC$NOC,labels = NOC$region)
Olympic$NOC<-as.character(Olympic$NOC)

Olympic$Sex<-factor(Olympic$Sex,levels =c("M","F") ,labels = c("Male","Female"))
Olympic$Medal<-factor(Olympic$Medal,levels=c("Gold","Silver","Bronze"),labels=c("Gold","Silver","Bronze"))

usethis::use_data(Olympic, overwrite = TRUE)
