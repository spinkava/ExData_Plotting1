##Plot 2: Line graph of Power over Time

library(data.table)

##Select data from only 2007-02-01 and 2007-02-02
housePower <- fread("household_power_consumption.txt")
houseDate <- as.Date(housePower$Date, format = "%d/%m/%Y")
housePowerBoolean <- houseDate == as.Date("2007-02-01") | houseDate == as.Date("2007-02-02")
housePower2 <- subset(housePower,housePowerBoolean)

#Plot Global Active Power by Time
houseTimes <- strptime(paste(housePower2$Date,housePower2$Time),format = "%d/%m/%Y %H:%M:%S")
png("plot2.png")
plot(houseTimes,as.numeric(housePower2$Global_active_power), type = "l", xlab = "", 
       ylab = "Global Active Power (kilowatts)")
dev.off()
