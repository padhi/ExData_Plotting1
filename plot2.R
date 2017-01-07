library("dplyr")
library("lubridate")
#read the text file
PowerConsumptionData <- read.table("household_power_consumption.txt", sep=";",header = TRUE, stringsAsFactors=FALSE)
#using dmy from lubridate package to convert Date/Time class instead of as.Date
DateRange1<- dmy("01/02/2007")
DateRange2<- dmy("02/02/2007")
#subset the data only for two days (01/02/2007-02/02/2007)
PowerConsumptionDataSubset <- filter(PowerConsumptionData, dmy(Date) >= DateRange1 & dmy(Date) <= DateRange2)
DateTime <- dmy_hms(paste(PowerConsumptionDataSubset$Date, PowerConsumptionDataSubset$Time, sep=" "))
GlobalActivePower <- as.numeric(PowerConsumptionDataSubset$Global_active_power)
#set the png file
png("plot2.png", width=480, height=480)
par(mfrow = c(1, 1))
#plot the graph
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
