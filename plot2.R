# read file
file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# subset dataset to required dates
data <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

# create plot2
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png(filename="plot2.png", width=480, height=480)
plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
