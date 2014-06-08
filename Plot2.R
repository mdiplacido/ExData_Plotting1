setwd("C:/enlistments/github/ExData_Plotting1")
data <- read.csv("./household_power_consumption.txt", sep=";", header=T)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

head(data)
str(data)

febData <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

globalActivePowerNumeric <- as.numeric(as.character(febData$Global_active_power))
dateAndTime <- as.POSIXct(paste(febData$Date, febData$Time))

windows(width=480, height=480)
dev.cur()

par(bg="white")
plot(dateAndTime, globalActivePowerNumeric, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file = "Plot2.png")
dev.off()
dev.cur()
