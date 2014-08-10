setwd("C:/Users/Mike/Documents/R/Exploratory_Data_Analysis")
data_file_path = paste(getwd() , "/household_power_consumption.zip" , sep = '')

download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip' , data_file_path)
unzip(data_file_path)

pwrdata = read.table('household_power_consumption.txt' , sep = ";" , header = TRUE , colClasses = 'character')
dateTime <- paste(pwrdata[,1] , pwrdata[,2] , sep = " ")
pwrdata <- cbind( pwrdata , dateTime)
pwrdata[,10] <- as.character(pwrdata[,10])

pwrdata[,1] <- as.Date(pwrdata[,1], format = '%d/%m/%Y')

data <- subset(pwrdata , Date <=  '2007-02-02' )
data <- subset(data , Date >=  '2007-02-01')

data[,3] <- as.numeric(data[,3])
data[,4] <- as.numeric(data[,4])
data[,5] <- as.numeric(data[,5])
data[,7] <- as.numeric(data[,7])
data[,8] <- as.numeric(data[,8])
data[,9] <- as.numeric(data[,9])


dts <- strptime(data[,10] , format = "%d/%m/%Y %H:%M:%S")
data1 <- cbind(data , dts)

par(mfrow = c(2, 2))
par(cex=.4)

plot(data1[,11] , data1[,3] , type = 'l' ,  ylab = 'Global Active Power' , xlab = '')

plot(data1[,11] , data1[,5] , type = 'l' ,  ylab = 'Voltage' , xlab = 'datetime')

plot(data1[,11] , data1[,7] ,  type = 'l' , ylab = 'Energy sub metering' , xlab = '' , col = "black" )
lines(data1[,11] , data1[,8], col = "red") 
lines(data1[,11] , data1[,9] , col = "blue")
legend("topright",  bty = "n",lwd=1, pt.cex = 0.1 , y.intersp=.8, col = c("black" , "blue", "red"), legend = c("Sub_Metering_1    ", "Sub_Metering_2    " , "Sub_Metering_3    "))

plot(data1[,11] , data1[,4] , type = 'l' ,  ylab = 'Global_reactive_power' , xlab = '')


dev.copy(device=png,"plot4.png" , width = 480, height = 480)
dev.off()