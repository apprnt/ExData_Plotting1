#############################
# Reading original data set
#############################

data<-read.table("data/household_power_consumption.txt", sep=";", header=T, na.strings="?")

#############################
# Subsetting
#############################

data1 <- data[(as.character(data$Date) =="1/2/2007") | (as.character(data$Date) == "2/2/2007"),]


#############################
# Creating timeline variable
#############################

data1$TimeDate <- paste(data1$Time, data1$Date, sep=" ")
data1$timeLine <- strptime(data1$TimeDate, format="%H:%M:%S %d/%m/%Y")


# plot4
############################ 
png(file = "plot4.png", width=480, height=480)


par(mfrow=c(2,2))

plot(data1$timeLine, data1$Global_active_power, type="l", xlab="", ylab="Global active power")
plot(data1$timeLine, data1$Voltage, type="l", xlab="datetime", ylab="Voltage")


with(data1, plot(timeLine, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data1, lines(timeLine, Sub_metering_2, col="red"))
with(data1, lines(timeLine, Sub_metering_3, col="blue"))

plot(data1$timeLine, data1$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
par(mfrow=c(1,1))
