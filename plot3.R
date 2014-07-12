## Script name:  plot3.R
## July 11, 2014
## (1) This script reads in the "household_power_consumption.txt" file
##   which is previously downloaded, unzipped, and stored in the working directory.
##   If the data is in a different location, adjust the path accordingly
## (2) The 'sqldf' package is used to read only the data for Feb. 1, 2007 and
##   Feb. 2, 2007, and store the result in dfData dataframe (this step takes
##   a while)
## (3) strptime function is used to combine the Date and Time values (chr) into POSIXlt
##   object and the value is stored in DateTime column for plotting purpose
## (4) The png graphic file device is used to stored the histogram
## (5) plot, lines and legend function are used to generate the graph  
##
##
library(sqldf)
myFile <- "./household_power_consumption.txt"
mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfData <- read.csv2.sql(myFile, mySql, header=TRUE, sep=";")
dfData$DateTime <- strptime(paste(dfData$Date,dfData$Time), format="%d/%m/%Y %H:%M:%S")
##
## create plot3, a scatterplot comparing the Sub_metering_1, Sub_metering_2,
## and Sub_metering_3 within those two days
png(filename = "./plot3.png", width = 480, height = 480)
with(dfData, plot(DateTime, Sub_metering_1, xlab = "", type = 'l', col = 'grey',
	ylab = 'Energy sub metering', main = NULL))
with(dfData, lines(DateTime, Sub_metering_2, type = 'l', col = 'red'))
with(dfData, lines(DateTime, Sub_metering_3, type = 'l', col= 'blue'))
legend('topright', col = c('grey', 'red','blue'), lty = 1,
	legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()
