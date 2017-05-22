#library(gsubfn)
fn <- "./household_power_consumption.txt";
pat <- "^[1,2]/2/2007"

#data <- read.pattern( fn, pattern = pat, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
#Read the Training data.
dtConsumer <- read.table(text = grep(pat, readLines(fn), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

png("plot1.png", width=480, height=480)
hist(dtConsumer$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
dev.off()
