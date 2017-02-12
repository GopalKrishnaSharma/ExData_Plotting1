#Six step code to generate and save the required plots

#Loading data from the Electric Power Consumption dataset
power <- read.table("household_power_consumption.txt",sep=";", header = TRUE)

#Subsetting data to filter out records between 2007-02-01 and 2007-02-02
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Setting the frame for multiple plots
par(mfrow=c(2,2))

#Plot the four plots
##PLOT 1
plot(subpower$Time,subpower$Global_active_power, type="l", xlab="", ylab="Global Active Power")

##PLOT 2
plot(subpower$Time,subpower$Voltage, type="l", xlab="datetime", ylab="Voltage")

##PLOT 3
plot(subpower$Time,subpower$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subpower$Time,subpower$Sub_metering_2,col="red")
lines(subpower$Time,subpower$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),y.intersp = .5,lty=c(1,1),bty="n",cex=.5)

#PLOT 4
plot(subpower$Time,subpower$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Copy the plot locally
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
