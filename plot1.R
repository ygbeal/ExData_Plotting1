## Script name:  plot1.R
## July 11, 2014
##
## (1) This script reads in the "household_power_consumption.txt" file
##   which is previously downloaded, and stored in the working directory.
##   if the data is in a different location, adjust the path accordingly
## (2) The 'sqldf' package is used to read only the data for Feb. 1, 2007 and
##   Feb. 2, 2007, and store the result in dfData dataframe (this step takes
##   a while)
## (3) The png graphic file device is used to stored the histogram
## (4) hist cunction is used to generate the graph  
##
library(sqldf)
myFile <- "./household_power_consumption.txt"
mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfData <- read.csv2.sql(myFile, mySql, header=TRUE, sep=";")
##
## create plot1, a histogram about the Global Active Power
## by using the 'base' graphing system
png(filename = "plot1.png", width = 480, height = 480)
with(dfData, hist(Global_active_power, col = 'red', bg = 'transparent',
	xlab = 'Global Active Power (Kilowatts)', main = 'Global Active Power'))
dev.off()
