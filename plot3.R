##Plot 3: Line graph of sub metering over Time

library(data.table)

##Select data from only 2007-02-01 and 2007-02-02
housePower <- fread("household_power_consumption.txt")
houseDate <- as.Date(housePower$Date, format = "%d/%m/%Y")
housePowerBoolean <- houseDate == as.Date("2007-02-01") | houseDate == as.Date("2007-02-02")
housePower2 <- subset(housePower,housePowerBoolean)

#Plot sub metering by Time
houseTimes <- strptime(paste(housePower2$Date,housePower2$Time),format = "%d/%m/%Y %H:%M:%S")
png("plot3.png")
plot(houseTimes,as.numeric(housePower2$Sub_metering_1), type = "l", xlab = "", 
       ylab = "Energy sub metering")
lines(houseTimes,as.numeric(housePower2$Sub_metering_2), col = "red")
lines(houseTimes,as.numeric(housePower2$Sub_metering_3), col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1, col = c("black","red","blue"))
dev.off()