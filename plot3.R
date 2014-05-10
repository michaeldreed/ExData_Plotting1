# R Script file for creating plot 3

# Read the data in and subset to required dates
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                 na.strings=c("NA", "?"))
data<-subset(data, as.Date(data$Date, format="%d/%m/%Y")>="2007-02-01")
data<-subset(data, as.Date(data$Date, format="%d/%m/%Y")<="2007-02-02")

# Specify data for plot
one<-as.double(data$Sub_metering_1)
two<-as.double(data$Sub_metering_2)
three<-as.double(data$Sub_metering_3)
DATE<-strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

# Create PNG 
png(filename="plot3.png")

# Generate plot
plot(DATE,one,type="l",main="", xlab="", 
     ylab="Energy sub metering")
lines(DATE,two,col="red")
lines(DATE,three,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"))

# close device
dev.off()

######## Need to fix legend being cut off
