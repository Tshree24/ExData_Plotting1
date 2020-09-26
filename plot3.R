dat <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")

data <- subset(dat, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dat)


datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

with(data, {
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy Sub Metering")
  lines(Sub_metering_2 ~ Datetime, col = "red")
  lines(Sub_metering_3 ~ Datetime, col = "blue")
  
})
legend("topright", col = c("black","red","blue"), lwd = 2, lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
dev.copy(png, "plot3.png", width =480, height = 480)
dev.off()