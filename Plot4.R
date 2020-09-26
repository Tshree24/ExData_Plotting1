
dat <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")

data <- subset(dat, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dat)


datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))


with(data, {
  plot(data$Voltage ~ data$Datetime,ylab = "Voltage", type = "l" )
  plot(data$Global_active_power ~ data$Datetime, xlab = "",ylab = "Global Active Power", type = "l")
  plot(Sub_metering_1 ~ data$Datetime, type = "l", ylab = "Energy Sub Metering")
   with(data,lines(Sub_metering_2 ~ data$Datetime, col = "red"))
   with(data,lines(Sub_metering_3 ~ data$Datetime, col = "blue"))
   legend("topright", col = c("black","red","blue"), lwd = 2, lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
  plot(data$Global_reactive_power ~ data$Datetime, type = "l", ylab = "Global_reactive_power")
})

dev.copy(png, "plot4.png", width =480, height=480)
dev.off()








