library("lubridate")
## Set Directory
          setwd("C:/Users/Dell/Documents/DataScientist/testdata")
## Read data into a dataframe
          elecCon <- read.table( "household_power_consumption.txt" , header = TRUE ,
                         sep=";" ,
                         na.strings = "?" )

## Convert date & time from factor to POSIXct
         elecCon$Date <- dmy(elecCon$Date)
         elecCon$Time<-hms(elecCon$Time)

## Subset the data to 2 days
   e1<-subset(elecCon,Date > as.POSIXct("2007-02-01") & Date <= as.POSIXct("2007-02-02"))

## Plot 4 graphs in 2 columns 2 rows format
    par("mfrow"=c(2,2))
    mar=c(1,1,1,1)
    ##Graph 1
    x<-e1$Date+e1$Time
    y <-e1$Global_active_power
    ##Graph2
    plot(x,y,type="l",ylab="Global_active_power")
    z<-e1$Voltage
    ##Graph3
    plot(x,z,type="l",ylab="Voltage",xlab="Datetime")
    w<-e1$Global_reactive_power
    plot(x,w,ylab="Global Reactive Power",xlab="DateTime",type="l")
    ##Graph4
    y11<-e1$Sub_metering_2
    z11<-e1$Sub_metering_3
    w11<-e1$Sub_metering_1
    plot(x,y11,ylab="Energy Submetering",type="l",col="red")
    points(x,z11,col="blue",type="l")
    points(x,w11,type="l")
    legend("topright",col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


## Create a PNG file
    dev.copy(png, file= "Plot4.png")


 

