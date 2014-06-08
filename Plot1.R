setwd("C:/enlistments/github/ExData_Plotting1")
data <- read.csv("./household_power_consumption.txt", sep=";", header=T)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

head(data)
str(data)

febData <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

globalActivePowerNumeric <- as.numeric(as.character(febData$Global_active_power))

windows(width=480, height=480)
dev.cur()
par(bg="white")
hist(globalActivePowerNumeric, xlab="Global Active Power (kilowatts)", main="Global Active Power", col = "red")

dev.copy(png, file = "Plot1.png")
dev.off()
dev.cur()
