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

#combine date and time columns
x <-as.POSIXct(strptime(paste(powerData$Date,powerData$Time), "%d/%m/%Y %H:%M:%S"))

png(file = "plot2.png")

plot(x,powerData$Global_active_power, type="n",
     xlab = "", 
     ylab = "Global Active Power (kilowatts)" )

lines(x,powerData$Global_active_power) 

dev.off()