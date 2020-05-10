# Exploratory Data Analysis Week 1 Course Project
# Plot 3

# Open file and subset for the two dates of interest
library(data.table)
filename <- "household_power_consumption.txt"
power <- fread(filename, header = TRUE, na.strings = "?")
powerdates <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")

# Create Date/Time variable for x axis
library(lubridate)
datetime <- paste(powerdates$Date, powerdates$Time)       #Create new date+time variable
datetime1 <- dmy_hms(datetime)                            #Format date/time variable
dt <- data.table(powerdates, datetime1)                   #Add to data table

# Make graph and save to png file
png(filename = "plot3.png", height = 480, width = 480) 
with(dt, plot(datetime1, Sub_metering_1, type = "n",
              xlab = "", ylab = "Energy sub metering"))
with(dt, lines(datetime1, Sub_metering_1, col = "black"))
with(dt, lines(datetime1, Sub_metering_2, col = "red"))
with(dt, lines(datetime1, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", 
                  "Sub_metering_3"), lty = 1)
dev.off()