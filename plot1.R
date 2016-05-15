library(dplyr)

## Read household_power_consumption.txt and perform filteration
data<-read.table('household_power_consumption.txt', sep=';', header=TRUE,na.strings="?") 
data<-mutate(data,Date = as.Date(Date, '%d/%m/%Y')) 
data<-mutate(data,Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) 
data<-filter(data,Time >= strftime('2007-02-01 00:00:00'), Time < strftime('2007-02-03 00:00:00')) 
  


#Draw plot1.png
png(filename='plot1.png', width=480, height=480, units='px')

hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

dev.off()



