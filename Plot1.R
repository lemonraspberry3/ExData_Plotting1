# Exploratory Data Analysis Week 1 Course Project
# Plot 1

# Open file and subset for the two dates of interest
library(data.table)
filename <- "household_power_consumption.txt"
power <- fread(filename, header = TRUE)
powerdates <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")

# Plot 1 - Create and save as .png
class(powerdates$Global_active_power) <- "numeric"
png(filename = "plot1.png", height = 480, width = 480)
hist(powerdates$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
