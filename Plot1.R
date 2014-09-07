## Project 1 - Plot 1
## Setting local working dir
setwd("F:/My Studies/MOOCs In Progress/ Johns Hopkins Data Science Specialization/04 Exploratory Data Analysis/Projects/Project_1")

## Load data from file
energy_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
head(energy_data)

## Check types of variables in data frame
str(energy_data)

## Convert date variable
energy_data$Date <- as.Date(energy_data$Date, format="%d/%m/%Y")
subset <- subset(energy_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert Time variable
subset$Time <- strptime(subset$Time, "%H:%M:%S")

## Remove complete data frame
rm(energy_data)

## Plotting the histogram
hist(subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

## Saving to file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()

