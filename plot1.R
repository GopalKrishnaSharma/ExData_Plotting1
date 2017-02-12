##Four step code to generate and save the required plot

#Loading data from the Electric Power Consumption dataset
power <- read.table("household_power_consumption.txt",sep=";", header = TRUE)

#Subsetting data to filter out records between 2007-02-01 and 2007-02-02
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#Plotting the histogram and annotating the graph
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#Copy the plot locally
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
