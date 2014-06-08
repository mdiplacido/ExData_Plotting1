data <- read.csv("./household_power_consumption.txt", sep=";", header=T)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

head(data)
str(data)

febData <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

head(febData)

sub_metering_1 <- as.numeric(as.character(febData$Sub_metering_1))
sub_metering_2 <- as.numeric(as.character(febData$Sub_metering_2))
sub_metering_3 <- as.numeric(as.character(febData$Sub_metering_3))
Global_active_power <- as.numeric(as.character(febData$Global_active_power))
Voltage <- as.numeric(as.character(febData$Voltage))
Global_reactive_power <- as.numeric(as.character(febData$Global_reactive_power))
dateAndTime <- as.POSIXct(paste(febData$Date, febData$Time))

# windows(width=480, height=480)
png(width=480, height=480, file="Plot4.png")
dev.cur()

par(bg="white")
par(mfrow=c(2,2))

plot(dateAndTime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(dateAndTime, Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(dateAndTime, sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dateAndTime, sub_metering_2, col="red")
lines(dateAndTime, sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=c(2.5,2.5,2.5), bty="n")

plot(dateAndTime, Global_reactive_power, type="l", xlab="datetime")

# copy truncates the legend, need to print directly to the png.
# dev.copy(png, file = "Plot3.png")
dev.off()
dev.cur()
