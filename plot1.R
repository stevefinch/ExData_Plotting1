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

png(file = "plot1.png")

hist(powerData$Global_active_power, breaks = 12, col = "Red",
    main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)",    
    ylim = c(0, 1200), 
    xaxt = 'n')

axis(side=1, at=seq(0,6, 2), labels=seq(0,6,2))

dev.off()