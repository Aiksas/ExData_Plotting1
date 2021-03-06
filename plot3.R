epc <- read.csv(file.choose(), na.strings='?')

str(epc)
head(epc)
epc_feb <- epc[(epc$Date == '1/2/2007') |
                 (epc$Date == '2/2/2007'),]
str(epc_feb)

epc_feb$Date <- as.Date(epc_feb$Date, '%d/%m/%Y')
epc_feb$DateTime <- strptime(paste(epc_feb$Date, 
                                   epc_feb$Time), 
                             format = '%Y-%m-%d %H:%M:%S')
str(epc_feb)
head(epc_feb)


# Plot 3

png("plot3.png", width = 480, height = 480)

plot(epc_feb$DateTime, epc_feb$Sub_metering_1, 
     xlab = '',
     ylab = 'Energy sub metering', 
     type = 'n')
lines(epc_feb$DateTime, epc_feb$Sub_metering_1, col = 'black')
lines(epc_feb$DateTime, epc_feb$Sub_metering_2, col = 'red')
lines(epc_feb$DateTime, epc_feb$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'),
       lty = c(1, 1, 1))

dev.off()
