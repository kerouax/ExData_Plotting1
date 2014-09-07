## Project 1 - Plot 2
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

## Plotting 2nd plot
plot(subset$Global_active_power ~ subset$DateTime, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Saving to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
