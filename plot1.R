setwd("C:/Users/Mike/Documents/R/Exploratory_Data_Analysis")
data_file_path = paste(getwd() , "/household_power_consumption.zip" , sep = '')

download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip' , data_file_path)
unzip(data_file_path)

pwrdata = read.table('household_power_consumption.txt' , sep = ";" , header = TRUE , colClasses = 'character')
pwrdata[,1] <- as.Date(pwrdata[,1], format = '%d/%m/%Y')

data <- subset(pwrdata , Date <=  '2007-02-02' )
data <- subset(data , Date >=  '2007-02-01')

data[,3] <- as.numeric(data[,3])

hist(data[,3] , col = 'red' , main = 'Global Active Power' , xlab = 'Global Actve Power (kilowatts)' ,  ylab = 'Frequency' , xlim=c(0,6),  ylim=c(0, 1200) )
### note sending the hist() to an object, the calling the object provides summary 

dev.copy(device=png,"plot1.png" , width = 480, height = 480)
dev.off()

