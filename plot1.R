##Plot 1: Histogram of Global Active Power

library(data.table)

##Select data from only 2007-02-01 and 2007-02-02
housePower <- fread("household_power_consumption.txt")
houseDate <- as.Date(housePower$Date, format = "%d/%m/%Y")
housePowerBoolean <- houseDate == as.Date("2007-02-01") | houseDate == as.Date("2007-02-02")
housePower2 <- subset(housePower,housePowerBoolean)

##Construct histogram and create png
png("plot1.png")
hist(as.numeric(housePower2$Global_active_power),col = "red",
       main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
