plot4 <- function() {
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
	
	## Set window properties
	par(mfrow = c(2,2))
	
	## Plot graph 1
	plot(data$Date, data$Global_active_power, type="n", main="", xlab="", 
		 ylab="Global Active Power")
	lines(data$Date, data$Global_active_power)
	
	## Plot graph 2
	plot(data$Date, data$Voltage, type="n", main="", xlab="datetime", 
		 ylab="Voltage")
	lines(data$Date, data$Voltage)
	
	## Plot graph 3
	plot(data$Date, data$Sub_metering_1, type="n", main="", xlab="",  ylab="Energy sub metering")
	lines(data$Date, data$Sub_metering_1, col="black")
	lines(data$Date, data$Sub_metering_2, col="red")
	lines(data$Date, data$Sub_metering_3, col="blue")
	legend("topright", col=c("black","red","blue"), pch="_",
		   legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	
	## Plot graph 4
	## Plot graph 1
	plot(data$Date, data$Global_reactive_power, type="n", main="", xlab="datetime", 
		 ylab="Global Reactive Power")
	lines(data$Date, data$Global_reactive_power)
	
	## Write to png
	dev.copy(png, file="plot4.png") 
	dev.off()
	
}