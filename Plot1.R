# Coursera Data Science: Exploratory Data Analysis
# Course project 1: Plot1
# Quinn Koller
################################################################################
## load the data
rm(list = ls())
power <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# convert the date variable to Date class
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# Subset the data
subpower <- subset(power, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
subpower$datetime <- strptime(paste(subpower$Date, subpower$Time), "%Y-%m-%d %H:%M:%S")

# Plot 1
attach(subpower)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(subpower)
