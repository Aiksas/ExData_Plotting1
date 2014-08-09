epc <- read.csv(file.choose(), na.strings='?')
## I'm not sure if file.choose() also works for Mac... 

str(epc)
head(epc)
epc_feb <- epc[(epc$Date == '1/2/2007') |
                 (epc$Date == '2/2/2007'),]
str(epc_feb)

epc_feb$Date <- as.character(epc_feb$Date)
epc_feb$Time <- as.character(epc_feb$Time)

epc_feb$Date <- as.Date(epc_feb$Date, '%d/%m/%Y')
epc_feb$DateTime <- strptime(paste(epc_feb$Date, 
                                   epc_feb$Time), 
                             format = '%Y-%m-%d %H:%M:%S')
str(epc_feb)
head(epc_feb)

## Plot 1

png("plot1.png", width = 480, height = 480)

hist(epc_feb$Global_active_power, col='red', xlab='Global Active Power (kilowatts)',
     ylab='Frequency', main='Global Active Power')

dev.off()
