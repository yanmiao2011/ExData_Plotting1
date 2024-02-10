# read file
file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# subset dataset to required dates
data <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

# create plot3
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png(filename="plot3.png", width=480, height=480)
plot(datetime, data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, data$Sub_metering_2, type="l", col="red")
lines(datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
