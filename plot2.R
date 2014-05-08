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
# plot2
############################ 


png(file = "plot2.png", width=480, height=480)
plot(data1$timeLine, data1$Global_active_power, type="l", xlab="", ylab="Global active power (kilowatts)")
dev.off()
