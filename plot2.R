## Script name:  plot2.R
## July 11, 2014
##
## (1) This script reads in the "household_power_consumption.txt" file
##   which is previously downloaded, unzipped and stored in the working
##   directory. If the data is in a different location, adjust the path
##   accordingly
## (2) The 'sqldf' package is used to read only the data for Feb. 1, 2007 and
##   Feb. 2, 2007, and store the result in dfData dataframe (this step takes
##   a while)
## (3) strptime function is used to combine the Date and Time values (chr)
##   into POSIXlt object and the value is stored in DateTime column for
##   plotting purpose
## (4) The png graphic file device is used to stored the histogram
## (5) plot function is used to generate the graph  
##
##
library(sqldf)
myFile <- "./household_power_consumption.txt"
mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfData <- read.csv2.sql(myFile, mySql, header=TRUE, sep=";")
dfData$DateTime <- strptime(paste(dfData$Date,dfData$Time), format="%d/%m/%Y %H:%M:%S")
##
## create plot2, a scatterplot about the Global Active Power within those two days
png(filename = "./plot2.png", width = 480, height = 480)
with(dfData, plot(DateTime, Global_active_power, xlab = "", type = 'l', bg = "transparent",
	ylab = 'Global Active Power (Kilowatts)', main = NULL))
dev.off()
