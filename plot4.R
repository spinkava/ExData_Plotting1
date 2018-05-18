##Plot 4: Four Graphs in One

library(data.table)

##Select data from only 2007-02-01 and 2007-02-02
housePower <- fread("household_power_consumption.txt")
houseDate <- as.Date(housePower$Date, format = "%d/%m/%Y")
housePowerBoolean <- houseDate == as.Date("2007-02-01") | houseDate == as.Date("2007-02-02")
housePower2 <- subset(housePower,housePowerBoolean)

#Common variables
houseTimes <- strptime(paste(housePower2$Date,housePower2$Time),format = "%d/%m/%Y %H:%M:%S")
png("plot4.png")
par(mfrow = c(2,2))

#Plot the Global Active Power
plot(houseTimes,as.numeric(housePower2$Global_active_power), type = "l", xlab = "", 
       ylab = "Global Active Power")

#Plot Voltage
plot(houseTimes,as.numeric(housePower2$Voltage), type = "l", xlab = "datetime", 
       ylab = "Voltage")

#Plot sub metering
plot(houseTimes,as.numeric(housePower2$Sub_metering_1), type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(houseTimes,as.numeric(housePower2$Sub_metering_2), col = "red")
lines(houseTimes,as.numeric(housePower2$Sub_metering_3), col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1, bty = "n", col = c("black","red","blue"))

#Plot reactive power
plot(houseTimes,as.numeric(housePower2$Global_reactive_power), type = "l", xlab = "datetime", 
       ylab = "Global_reactive_power")

dev.off()