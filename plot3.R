#######################################################
# read data from text file (same code used in all plots)
#######################################################

#find column classes to make file read faster
tab5rows <- read.table("household_power_consumption.txt",  header = TRUE, sep=";", nrows=5)
classes <- sapply(tab5rows, class)

#read entire file
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep=";",
                        colClasses = classes, , nrows=2075260 , na.strings = "?")

#keep only days wanted for graphs
powerData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"), ]


#######################################################
# draw plot
#######################################################

x <-as.POSIXct(strptime(paste(powerData$Date,powerData$Time), "%d/%m/%Y %H:%M:%S"))

png(file = "plot3.png")

plot(x,powerData$Sub_metering_1, type="n",
     xlab = "", 
     ylab = "Energy sub metering" )

lines(x,powerData$Sub_metering_1, col = "Black") 
lines(x,powerData$Sub_metering_2, col = "Red") 
lines(x,powerData$Sub_metering_3, col = "Blue") 

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=c(1,1,1), col=c("Black","Red", "Blue")) 

dev.off()