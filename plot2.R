## Script name:  plot2.R
## This script reads in the household_power_consumption.txt file
##   which is previously downloaded, and stored in the working directory
## The 'sqldf' package is used to read only the data for Feb. 1, 2007 and
##   Feb. 2, 2007
## The png graphic file device is used to stored the plot  
## July 10, 2014
##
library(sqldf)
myFile <- "./household_power_consumption.txt"
mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfData <- read.csv2.sql(myFile, mySql, header=TRUE, sep=";")
dfData$DateTime <- strptime(paste(dfData$Date,dfData$Time), format="%d/%m/%Y %H:%M:%S")

##head(dfData)
##tail(dfData)
## create plot2, a scatterplot about the Global Active Power within those two days
png(filename = "plot2.png", width = 480, height = 480)
with(dfData, plot(DateTime, Global_active_power, xlab = "", type = 'l',
	ylab = 'Global Active Power (Kilowatts)', main = NULL))
dev.off()
Sys.setlocale("LC_TIME", "English")