##Course Project one##
##Exploratory Data Analysis##
##library##
library(data.table)
##Data Uploading##
library(readr)
dataFile = "C:/Users/bwabo/OneDrive/Desktop/Data Science/household_power_consumption.txt"
#Plot 1 
data = read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData = data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
globalActivePower = as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
##Plot 2 
data = read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData = data[data$Date %in% c("1/2/2007","2/2/2007") ,]
##Str
#str(subSetData)/#Data Manipulating
datetime = strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower = as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

##Plot 3 
#str(subSetData)/#Data Manipulating
datetime = strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower = as.numeric(subSetData$Global_active_power)
subMetering1 = as.numeric(subSetData$Sub_metering_1)
subMetering2 = as.numeric(subSetData$Sub_metering_2)
subMetering3 = as.numeric(subSetData$Sub_metering_3)
##Plots
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
##Plot 4 
#str(subSetData)/#Data Manipulating
datetime = strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower = as.numeric(subSetData$Global_active_power)
globalReactivePower = as.numeric(subSetData$Global_reactive_power)
voltage = as.numeric(subSetData$Voltage)
subMetering1 = as.numeric(subSetData$Sub_metering_1)
subMetering2 = as.numeric(subSetData$Sub_metering_2)
subMetering3 = as.numeric(subSetData$Sub_metering_3)
##Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
getwd()
