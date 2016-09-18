# Clear Console Screen
cat("\f") 

# Clear workspace
rm(list=ls())

# Set Working directory
setwd('/Users/Shams/SkyDrive/535 Coursera/JHU - Data Science/4-Exploratory Data Analysis')

# Print and validate working directory
getwd()

##############################################################################################################

## Plot 2

# Read Data
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
head(data)

# Convert the date variable to date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
head(data$Date)

# Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
head(data)

# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
head(data$datetime)

# Draw Plot 2

data$datetime <- as.POSIXct(data$datetime)

attach(data)
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Save png file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)