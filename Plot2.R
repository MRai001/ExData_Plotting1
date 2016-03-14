library("lubridate")
setwd("C:/Users/Dell/Documents/DataScientist/testdata")
elecCon <- read.table( "household_power_consumption.txt" , header = TRUE ,
                         sep=";" ,
                         na.strings = "?" )

elecCon$Date <- dmy(elecCon$Date)
elecCon$Time<-hms(elecCon$Time)
e1<-subset(elecCon,Date > as.POSIXct("2007-01-31") & Date <= as.POSIXct("2007-02-02"))

 x<-e1$Date+e1$Time
 y <-e1$Global_active_power
 plot(x,y,type="l",ylab="Global_active_power")
 dev.copy(png, file= "Plot2.png")


