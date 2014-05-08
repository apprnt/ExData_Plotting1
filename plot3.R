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
############################ 
# plot3
############################ 

png(file = "plot3.png", width=480, height=480)
with(data1, plot(timeLine, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data1, lines(timeLine, Sub_metering_2, col="red"))
with(data1, lines(timeLine, Sub_metering_3, col="blue"))

legend("topright", pch=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
