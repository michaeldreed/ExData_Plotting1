# R Script file for creating plot 2

# Read the data in and subset to required dates
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                 na.strings=c("NA", "?"))
data<-subset(data, as.Date(data$Date, format="%d/%m/%Y")>="2007-02-01")
data<-subset(data, as.Date(data$Date, format="%d/%m/%Y")<="2007-02-02")

# Specify data for plot
GAP<-as.double(data$Global_active_power)
DATE<-strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

# Create PNG 
png(filename="plot2.png")

# Generate plot
plot(DATE,GAP, type="l", main="", xlab="", 
     ylab="Global Active Power (kilowatts)")

# close device
dev.off()