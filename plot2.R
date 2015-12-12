## Read Data
hhc <- file("household_power_consumption.txt")
hhc1 <- read.table(hhc, header=TRUE, sep=";", na.strings="?")

## Select Data
hhc2 <- hhc1[hhc1$Date %in% c("1/2/2007", "2/2/2007"),]
DateTime <- strptime(paste(hhc2$Date, hhc2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
hhc3 <- cbind(DateTime, hhc2)

## Plot
png(file = "plot2.png")
plot(hhc3$DateTime, hhc3$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
