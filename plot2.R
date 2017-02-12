#Loading data from the Electric Power Consumption dataset
power <- read.table("household_power_consumption.txt",sep=";", header = TRUE)

#Subsetting data to filter out records between 2007-02-01 and 2007-02-02
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Plotting and annotation
plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)",main="Global Active Power Vs Time")

#Copy the plot locally
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
