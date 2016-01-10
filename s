[33mcommit dacdca9ff0d92f6d77b8e5872af92ae664697686[m
Author: Stephen Quack <stephen_quack@hotmail.com>
Date:   Sun Jan 10 16:17:10 2016 -0500

    Create plot4.R

[1mdiff --git a/plot4.R b/plot4.R[m
[1mnew file mode 100644[m
[1mindex 0000000..b2417e3[m
[1m--- /dev/null[m
[1m+++ b/plot4.R[m
[36m@@ -0,0 +1,27 @@[m
[32m+[m[32mdownload.file(url = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile = 'household_power_consumption.zip')[m
[32m+[m[32munzip('household_power_consumption.zip')[m
[32m+[m[32mdata = read.csv(file = 'household_power_consumption.txt', header = TRUE, sep = ';')[m
[32m+[m[32mdata$Date = as.Date(data$Date, format = '%d/%m/%Y')[m
[32m+[m[32mdata_subset <- subset(data, data$Date >= "2007-02-01" & data$Date < "2007-02-03")[m
[32m+[m[32mdata_subset$Global_active_power <- as.numeric(as.character(data_subset$Global_active_power))[m
[32m+[m[32mdata_subset$Sub_metering_1 <- as.numeric(as.character(data_subset$Sub_metering_1))[m
[32m+[m[32mdata_subset$Sub_metering_2 <- as.numeric(as.character(data_subset$Sub_metering_2))[m
[32m+[m[32mdata_subset$Sub_metering_3 <- as.numeric(as.character(data_subset$Sub_metering_3))[m
[32m+[m[32mdata_subset$Voltage <- as.numeric(as.character(data_subset$Voltage))[m
[32m+[m[32mdata_subset$Global_reactive_power <- as.numeric(as.character(data_subset$Global_reactive_power))[m
[32m+[m
[32m+[m[32mpng(file = "plot4.png", width = 480, height = 480)[m
[32m+[m
[32m+[m[32mpar(mfrow = c(2,2))[m
[32m+[m[32mplot(data_subset$Global_active_power~as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S"), type = 'l', ylab = 'Global Active Power', xlab = '')[m
[32m+[m
[32m+[m[32mplot(data_subset$Voltage~as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S"), type = 'l', ylab = 'Voltage', xlab = 'datetime', col = 'black')[m
[32m+[m
[32m+[m[32mplot(data_subset$Sub_metering_1~as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S"), type = 'l', ylab = 'Energy sum metering', xlab = '', col = 'black')[m
[32m+[m[32mlines(data_subset$Sub_metering_2~as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S"), type = 'l', ylab = 'Energy sum metering', xlab = '', col = 'red')[m
[32m+[m[32mlines(data_subset$Sub_metering_3~as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S"), type = 'l', ylab = 'Energy sum metering', xlab = '', col = 'blue')[m
[32m+[m[32mlegend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col= c('black', 'red', 'blue'), lty = c(1,1,1), lwd = c(2.5,2.5,2.5))[m
[32m+[m
[32m+[m[32mplot(data_subset$Global_reactive_power~as.POSIXct(paste(data_subset$Date, data_subset$Time), format="%Y-%m-%d %H:%M:%S"), type = 'l', ylab = 'Global_reactive_power', xlab = 'datetime', col = 'black')[m
[32m+[m
[32m+[m[32mdev.off()[m
