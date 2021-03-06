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
dts <- strptime(data[,10] , format = "%d/%m/%Y %H:%M:%S")
data1 <- cbind(data , dts)

plot(data1[,11] , data1[,3] , type = 'l' ,  ylab = 'Global Active Power (kilowatts)' , xlab = '')

dev.copy(device=png,"plot2.png" , width = 480, height = 480)
dev.off()