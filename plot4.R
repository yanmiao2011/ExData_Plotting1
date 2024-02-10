# read file
file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# subset dataset to required dates
data <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

# create plot4
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#top-left
plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#top-right
plot(datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#bottom-left
plot(datetime, data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, data$Sub_metering_2, type="l", col="red")
lines(datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#bottom-right
plot(datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
