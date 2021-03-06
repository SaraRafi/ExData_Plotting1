

setwd("C://Users//Sara//Desktop//Sara//4_Exploratory Data Analysis//ExData_Plotting1")

##Loading data
data_0<-read.table(".//Data//household_power_consumption.txt", header=TRUE, sep=";")
data<- data_0[ which(data_0$Date== "1/2/2007"| data_0$Date== "2/2/2007"),]


## converting class to numeric
for(i in 3:9) {
  data[,i] <- as.numeric(as.character(data[,i]))
}  

##creating date variable
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 

##plot
png(".//Assignment 1//plot_4.png")  

par(mfrow=c(2,2))

#1
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ,ylab="Global Active Power")

#2
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#3
ylim<-c(0, max(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3))
plot(data$DateTime, data$Sub_metering_1, type = "l", ylim =ylim, xlab="", ylab="Energy sub metering" ) 
lines(data$DateTime, data$Sub_metering_2, type = "l", lty = 1, col = "red")  
lines(data$DateTime, data$Sub_metering_3, type = "l", lty = 1, col = "blue") 

legend("topright", lwd = c(1,2,3), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")

#4
plot(data$DateTime, data$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power")


dev.off() 
