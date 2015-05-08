## Read in household power consumption data file
powerdata <- read.table("C:/Users/pstap/Desktop/Coursera/04 Exploratory Data Analysis/Course Projects/Project 1/household_power_consumption.txt", header=TRUE, sep = ';')

## Convert columns to correct formats
powerdata$Global_active_power <- as.numeric(as.character(powerdata$Global_active_power))
powerdata$Global_reactive_power <- as.numeric(as.character(powerdata$Global_reactive_power))
powerdata$Voltage <- as.numeric(as.character(powerdata$Voltage))
powerdata$Global_intensity <- as.numeric(as.character(powerdata$Global_intensity))
powerdata$Sub_metering_1 <- as.numeric(as.character(powerdata$Sub_metering_1))
powerdata$Sub_metering_2 <- as.numeric(as.character(powerdata$Sub_metering_2))
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
powerdata$DateTime <- paste(powerdata$Date, powerdata$Time, sep = " ")

## subset household power consumption data file to only include 1/2/2007 to 2/2/2007
powerdata_sub <- subset(powerdata, Date == "2007-02-01" | Date == "2007-02-02")
## Convert date/time column
powerdata_sub$DateTime <- strptime(powerdata_sub$DateTime, format="%Y-%m-%d %H:%M:%S", tz=Sys.timezone())

## Construct plot 1
library(datasets)
hist(powerdata_sub$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!