## Script name:  plot1.R
## This script reads in the household_power_consumption.txt
##   which is previously downloaded, and stored in the working directory
## The 'sqldf' package is used to read only the data for Feb. 1, 2007 and
##   Feb. 2, 2007
## The png graphic file device was used to stored the histogram  
## July 10, 2014
##
library(sqldf)
myFile <- "./household_power_consumption.txt"
mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfData <- read.csv2.sql(myFile, mySql, header=TRUE, sep=";")
##head(dfData)
##tail(dfData)
## create plot1, a histogram about the Global Active Power
png(filename = "plot1.png", width = 480, height = 480)
with(dfData, hist(Global_active_power, col = 'red',
	xlab = 'Global Active Power (Kilowatts)', main = 'Global Active Power'))
dev.off()
strptime(subdata$datetime, "%d/%m/%y %H:%M:%S")