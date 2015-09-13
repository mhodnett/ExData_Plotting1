# read data
# assumes that a zip file containing the data is in the same folder
data <- read.csv(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";", na.strings = "?")
# use the following if the file is already unzipped
#data <- read.csv("household_power_consumption.txt", header=T, quote="\"", sep=";", na.strings = "?")
#dim(data)
#head(data)
data$Date2<-as.Date(data$Date,"%d/%m/%Y")

date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
sel_data=subset(data,data$Date2>=date1 & data$Date2<=date2)
sel_data$Time2<-strptime(paste(sel_data$Date,sel_data$Time),"%d/%m/%Y %H:%M:%S")

png("plot1.png", width = 480, height = 480, res = 72)
hist(sel_data$Global_active_power,main="Global Active Power",
	xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()
