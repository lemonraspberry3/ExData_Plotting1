# Exploratory Data Analysis Week 1 Course Project
# Plot 2

# Open file and subset for the two dates of interest
library(data.table)
filename <- "household_power_consumption.txt"
power <- fread(filename, header = TRUE, na.strings = "?")
powerdates <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")

# Plot 2 - Create and save as .png
library(lubridate)
class(powerdates$Global_active_power) <- "numeric"        #Convert to numeric class
datetime <- paste(powerdates$Date, powerdates$Time)       #Create new date+time variable
datetime1 <- dmy_hms(datetime)                            #Format date/time variable
dt <- data.table(powerdates, datetime1)                   #Add to data table

png(filename = "plot2.png", height = 480, width = 480)    #Create png file with plot
plot(dt$datetime1, dt$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()