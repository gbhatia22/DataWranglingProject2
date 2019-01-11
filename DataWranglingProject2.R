#Creating csv file
write.csv(titanic3,file = "titanic_original.csv")
DFtitanic<-titanic3

library(dplyr)
library(tidyr)

#1 Port of embarkation
naRowsInEmbarked<-which(is.na(DFtitanic$embarked))
DFtitanic$embarked[naRowsInEmbarked]<-"S"

#2 Age
meanOfAgeColumn<-mean(DFtitanic$age,na.rm=TRUE)
naRowsInAge<-which(is.na(DFtitanic$age))
DFtitanic$age[naRowsInAge]<-meanOfAgeColumn

#3 Lifeboat
naRowsInBoat<-which(is.na(DFtitanic$boat))
DFtitanic$boat[naRowsInBoat]<-"None"

#4 Cabin
DFtitanic<-mutate(DFtitanic,has_cabin_number="empty")
DFtitanic$has_cabin_number<-ifelse(is.na(DFtitanic$cabin),"0","1")

#5 Creating CSV file for titanic_clean
write.csv(DFtitanic,file = "titanic_clean.csv")






