# read file
file_name <- "household_power_consumption.txt"
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# subset dataset to required dates
data <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

# create plot1
png(filename="plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()