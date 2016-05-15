library(dplyr)

## Read household_power_consumption.txt and perform filteration
data<-read.table('household_power_consumption.txt', sep=';', header=TRUE,na.strings="?") 
data<-mutate(data,Date = as.Date(Date, '%d/%m/%Y')) 
data<-mutate(data,Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) 
data<-filter(data,Time >= strftime('2007-02-01 00:00:00'), Time < strftime('2007-02-03 00:00:00')) 


#Draw plot3.png
png(filename='plot3.png', width=480, height=480, units='px')

startDay = as.POSIXct(strftime("2007-02-01 00:00:00"))
endDay = as.POSIXct(strftime("2007-02-03 00:00:00"))
plot(data$Time,
     data$Sub_metering_1,
     xlim=c(startDay, endDay),
     xaxt="n",
     type="l",
     xlab="",
     ylab="Energy sub metering"
)

lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")

axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")

legend("topright", 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lty=c(1, 1, 1))

dev.off()