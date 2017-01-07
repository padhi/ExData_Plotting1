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
#get the Global_active_power column
GlobalActivePower <- as.numeric(PowerConsumptionDataSubset$Global_active_power)
#get the Sub_metering_1 column
SubMetering_1 <- as.numeric(PowerConsumptionDataSubset$Sub_metering_1)
#get the Sub_metering_2 column
SubMetering_2 <- as.numeric(PowerConsumptionDataSubset$Sub_metering_2)
#get the Sub_metering_3 column
SubMetering_3 <- as.numeric(PowerConsumptionDataSubset$Sub_metering_3)
#get the Global_reactive_power column
GlobalReactivePower <- as.numeric(PowerConsumptionDataSubset$Global_reactive_power)
#get the voltage column
Voltage <- as.numeric(PowerConsumptionDataSubset$Voltage)

#set the png file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
#plot the four graphs
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(DateTime, SubMetering_1, type="l", ylab="Energy sub metering", xlab="")
lines(DateTime, SubMetering_2, type="l", col="red")
lines(DateTime, SubMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd= 1, col=c("black", "red", "blue"), bty="o")

plot(DateTime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
