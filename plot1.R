#############################
# Reading original data set
#############################

data<-read.table("data/household_power_consumption.txt", sep=";", header=T, na.strings="?")

#############################
# Subsetting
#############################

data1 <- data[(as.character(data$Date) =="1/2/2007") | (as.character(data$Date) == "2/2/2007"),]

############################ 
# plot1
############################

png(file = "plot1.png", width=480, height=480)
hist(data1$Global_active_power, col="red", main="Global active power", xlab="Global active power (kilowatts)")
dev.off()
