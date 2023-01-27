## code to prepare `dataset` dataset goes here
load("data-raw/Olympic.RDA")

NOC[is.na(NOC$region) & !is.na(NOC$notes),2]<-NOC[is.na(NOC$region) & !is.na(NOC$notes),3]

Olympic$NOC<-factor(Olympic$NOC,levels = NOC$NOC,labels = NOC$region)
Olympic$NOC<-as.character(Olympic$NOC)

usethis::use_data(Olympic, overwrite = TRUE)
