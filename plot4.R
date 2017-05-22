#library(gsubfn)
fn <- "./household_power_consumption.txt";
pat <- "^[1,2]/2/2007"

#data <- read.pattern( fn, pattern = pat, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
#Read the Training data.
dtConsumer <- read.table(text = grep(pat, readLines(fn), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

dtConsumer$datetime <- strptime(paste(dtConsumer$Date, dtConsumer$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dtConsumer$datetime, dtConsumer$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dtConsumer$datetime, dtConsumer$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dtConsumer$datetime, dtConsumer$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dtConsumer$datetime, dtConsumer$Sub_metering_2, type="l", col="red")
lines(dtConsumer$datetime, dtConsumer$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dtConsumer$datetime, dtConsumer$Global_active_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()