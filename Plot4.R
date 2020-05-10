# Exploratory Data Analysis Week 1 Course Project
# Plot 4

# Open file and subset for the two dates of interest
library(data.table)
filename <- "household_power_consumption.txt"
power <- fread(filename, header = TRUE, na.strings = "?")
powerdates <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")

# Create Date/Time variable for x axis
library(lubridate)
class(powerdates$Global_active_power) <- "numeric"        #Convert to numeric class
datetime <- paste(powerdates$Date, powerdates$Time)       #Create new date+time variable
datetime1 <- dmy_hms(datetime)                            #Format date/time variable
dt <- data.table(powerdates, datetime1)                   #Add to data table

# Make graph and save to png file
png(filename = "plot4.png", height = 480, width = 480)
par(mfcol = c(2,2), mar = c(4,4,2,2), oma = c(0,0,0,0))   #Change to 2 x 2


# Top left plot: from Plot2.R
plot(dt$datetime1, dt$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power", 
     cex.lab = 0.75, cex.axis = 0.8)

# Bottom left plot: from Plot3.R
with(dt, plot(datetime1, Sub_metering_1, type = "n",
              xlab = "", ylab = "Energy sub metering",
              cex.lab = 0.75, cex.axis = 0.8))
with(dt, lines(datetime1, Sub_metering_1, col = "black"))
with(dt, lines(datetime1, Sub_metering_2, col = "red"))
with(dt, lines(datetime1, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", 
                  "Sub_metering_3"), lty = 1, bty = "n",
       cex = 0.6)

# Top right plot
with(dt, plot(datetime1, Voltage, type = "l",
              xlab = "datetime", ylab = "Voltage",
              cex.lab = 0.75, cex.axis = 0.8))

# Bottom right plot
with(dt, plot(datetime1, Global_reactive_power, 
              type = "l", xlab = "datetime",
              ylab = "Global_reactive_power",
              cex.lab = 0.75, cex.axis = 0.8))
dev.off()