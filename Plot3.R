## Project 1 - Plot 4
## Load data from file
energy_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
head(energy_data)

## Check types of variables in data frame
str(energy_data)

## Convert date variable
energy_data$Date <- as.Date(energy_data$Date, format="%d/%m/%Y")
subset <- subset(energy_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Add Date and Time column
datetime <- paste(subset$Date, subset$Time)
subset$DateTime <- as.POSIXct(datetime)

## Remove unneeded data
rm(energy_data, datetime)

## Producing plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(subset, plot(subset$DateTime, Sub_metering_1,type = 'l', xlab = "", ylab = 'Energy sub metering'))
with(subset, lines(subset$DateTime, Sub_metering_2, col = 'red'))
with(subset, lines(subset$DateTime, Sub_metering_3, col = 'blue'))
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'), lwd = 1)
dev.off()
