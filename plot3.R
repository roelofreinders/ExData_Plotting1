plot3 <- function() {
	## Read data
	data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
					 colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric",
					 			 "numeric","numeric","numeric"), na.strings="?")
	## Convert Dates for subesetting
	data$Date <- as.Date(data$Date, format="%d/%m/%Y")
	data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
	## Combine Date/Time
	data$Date <- strptime(paste(as.character(data$Date), data$Time), 
						  format="%Y-%m-%d %H:%M:%S")
	
	## Plot line graph
	plot(data$Date, data$Sub_metering_1, type="n", main="", xlab="",  ylab="Energy sub metering")
	lines(data$Date, data$Sub_metering_1, col="black")
	lines(data$Date, data$Sub_metering_2, col="red")
	lines(data$Date, data$Sub_metering_3, col="blue")
	legend("topright", col=c("black","red","blue"), pch="_",
		legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	
	## Write to png
	dev.copy(png, file="plot3.png") 
	dev.off()
	
}