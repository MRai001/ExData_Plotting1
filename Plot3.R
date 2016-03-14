library("lubridate")
library("reshape2")
library("ggplot2")
setwd("C:/Users/Dell/Documents/DataScientist/testdata")
elecCon <- read.table( "household_power_consumption.txt" , header = TRUE ,
                         sep=";" ,
                         na.strings = "?" )
elecCon$Date <- dmy(elecCon$Date)
e1<-subset(elecCon,Date > as.POSIXct("2007-01-31") & Date < as.POSIXct("2007-02-03"))
d<- melt(e1, id.vars = "Date", measure.vars = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),variable.name = "energy",variable.value ="value" )
#plot(as.factor(weekdays(d$Date)),d$value,type="l",ylab="Energy Submetering")
#plot(d$Date,d$value,type="o",ylab="Energy Submetering",col= "red")
#plot(strtrim(as.factor(weekdays(d$Date)),3),d$value)
##e2<-weekdays(e1$Date)
##e3<- cbind(e1,e2)
##e3$e2<-strtrim(e3$e2,3)
qplot(Date,value,data=d,color=energy,geom=c("point", "smooth"))

 
## dev.copy(png, file= "Plot1.png")



