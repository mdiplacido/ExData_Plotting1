setwd("C:/enlistments/github/ExData_Plotting1")
data <- read.csv("./household_power_consumption.txt", sep=";", header=T)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

head(data)
str(data)

febData <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

head(febData)

sub_metering_1 <- as.numeric(as.character(febData$Sub_metering_1))
sub_metering_2 <- as.numeric(as.character(febData$Sub_metering_2))
sub_metering_3 <- as.numeric(as.character(febData$Sub_metering_3))
dateAndTime <- as.POSIXct(paste(febData$Date, febData$Time))

# windows(width=480, height=480)
png(width=480, height=480, file="Plot3.png")
dev.cur()

par(bg="white")
plot(dateAndTime, sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dateAndTime, sub_metering_2, col="red")
lines(dateAndTime, sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=c(2.5,2.5,2.5))

# copy truncates the legend, need to print directly to the png.
# dev.copy(png, file = "Plot3.png")
dev.off()
dev.cur()
