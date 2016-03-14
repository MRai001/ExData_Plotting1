library("lubridate")
setwd("C:/Users/Dell/Documents/DataScientist/testdata")
##url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

##download.file(url, "household_power_consumption.zip",mode="wb")
##unzip("household_power_consumption.zip")

elecCon <- read.table( "household_power_consumption.txt" , header = TRUE ,
                         sep=";" ,
                         na.strings = "?" )
elecCon$Date <- dmy(elecCon$Date)
e1<-subset(elecCon,Date > as.POSIXct("2007-01-31") & Date <= as.POSIXct("2007-02-03"))
 head(e1)
hist(e1$Global_active_power,main="Global Active Power",xlab="Global Active Power(Kilowatts)",col="red")
 dev.copy(png, file= "Plot1.png")


