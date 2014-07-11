## Script name:  plot3.R
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
## create plot3, a scatterplot comparing the Sub_metering_1, Sub_metering_2,
## and Sub_metering_3 within those two days
png(filename = "plot3.png", width = 480, height = 480)
with(dfData, plot(DateTime, Sub_metering_1, xlab = "", type = 'l', col = 'grey',
	ylab = 'Energy sub metering', main = NULL))
with(dfData, lines(DateTime, Sub_metering_2, type = 'l', col = 'red'))
with(dfData, lines(DateTime, Sub_metering_3, type = 'l', col= 'blue'))
legend('topright', col = c('grey', 'red','blue'), lty = 1,
	legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()
Sys.setlocale("LC_TIME", "English")