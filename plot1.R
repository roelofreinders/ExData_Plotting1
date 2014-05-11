plot1 <- function() {
	
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
	
	## Plot histogram
	with(data, hist(Global_active_power, col="red", 
					main="Global Active Power", 
					xlab="Global Active Power (kilowatts)"))
	
	## Write to png
	dev.copy(png, file="plot1.png") 
	dev.off()
}