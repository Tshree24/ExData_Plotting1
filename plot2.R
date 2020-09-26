dat <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")

data <- subset(dat, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dat)


datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

plot(data$Global_active_power ~ data$Datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, "plot2.png", width =480, height = 480)
dev.off()