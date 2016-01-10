download.file(url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'household_power_consumption.zip')
unzip('household_power_consumption.zip')
data = read.csv(file = 'household_power_consumption.txt', header = TRUE, sep = ';')
data$Date = as.Date(data$Date, format = '%d/%m/%Y')
data_subset <- subset(data, data$Date >= "2007-02-01" & data$Date < "2007-02-03")
data_subset$Global_active_power <- as.numeric(as.character(data_subset$Global_active_power))
data_subset$Sub_metering_1 <- as.numeric(as.character(data_subset$Sub_metering_1))
data_subset$Sub_metering_2 <- as.numeric(as.character(data_subset$Sub_metering_2))
data_subset$Sub_metering_3 <- as.numeric(as.character(data_subset$Sub_metering_3))
data_subset$Voltage <- as.numeric(as.character(data_subset$Voltage))
data_subset$Global_reactive_power <- as.numeric(as.character(data_subset$Global_reactive_power))

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
plot(data_subset$Global_active_power~as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S"), type = 'l', ylab = 'Global Active Power', xlab = '')

plot(data_subset$Voltage~as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S"), type = 'l', ylab = 'Voltage', xlab = 'datetime', col = 'black')

plot(data_subset$Sub_metering_1~as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S"), type = 'l', ylab = 'Energy sum metering', xlab = '', col = 'black')
lines(data_subset$Sub_metering_2~as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S"), type = 'l', ylab = 'Energy sum metering', xlab = '', col = 'red')
lines(data_subset$Sub_metering_3~as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S"), type = 'l', ylab = 'Energy sum metering', xlab = '', col = 'blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col= c('black', 'red', 'blue'), lty = c(1,1,1), lwd = c(2.5,2.5,2.5))

plot(data_subset$Global_reactive_power~as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S"), type = 'l', ylab = 'Global_reactive_power', xlab = 'datetime', col = 'black')

dev.off()
