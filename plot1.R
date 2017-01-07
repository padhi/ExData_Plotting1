rm(list = ls())
library("dplyr")
library("lubridate")
#read the text file
PowerConsumptionData <- read.table("household_power_consumption.txt", sep=";",header = TRUE, stringsAsFactors=FALSE)
#using dmy from lubridate package to convert Date/Time class instead of as.Date
DateRange1<- dmy("01/02/2007")
DateRange2<- dmy("02/02/2007")
#subset the data only for two days (01/02/2007-02/02/2007)
PowerConsumptionDataSubset <- filter(PowerConsumptionData, dmy(Date) >= DateRange1 & dmy(Date) <= DateRange2)
#set the png file
png("plot1.png", width=480, height=480)
par(mfrow = c(1, 1)) 
#plot the histogram
hist(as.numeric(PowerConsumptionDataSubset$Global_active_power), main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red", border= "black")
dev.off()
