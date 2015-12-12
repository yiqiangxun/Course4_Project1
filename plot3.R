## Read Data
hhc <- file("household_power_consumption.txt")
hhc1 <- read.table(hhc, header=TRUE, sep=";", na.strings="?")

## Select Data
hhc2 <- hhc1[hhc1$Date %in% c("1/2/2007", "2/2/2007"),]
DateTime <- strptime(paste(hhc2$Date, hhc2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
hhc3 <- cbind(DateTime, hhc2)

## Plot
png(file = "plot3.png")

plot(hhc3$DateTime, hhc3$Sub_metering_1, type="l", col=LinesColor[1],xlab="", ylab="Energy sub metering")
lines(hhc3$DateTime, hhc3$Sub_metering_2, col=LinesColor[2])
lines(hhc3$DateTime, hhc3$Sub_metering_3, col=LinesColor[3])

LinesColor <- c("black", "red", "blue")
LabelNames <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend=LabelNames, col=LinesColor, lty="solid")

dev.off()
