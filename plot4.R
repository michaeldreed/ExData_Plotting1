# R Script file for creating plot 4

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
VOL<-as.double(data$Voltage)
GRP<-as.double(data$Global_reactive_power)

# Create PNG 
png(filename="plot4.png")

# Generate plots
par(mfrow=c(2,2)) # Specifies 4 subplots (2x2)

# Plot 1 : Top Left
plot(DATE,GAP, type="l", main="", xlab="", 
     ylab="Global Active Power")

# Plot 2 : Top Right
plot(DATE,VOL, type="l",main="",xlab="datetime",ylab="Voltage")

# Plot 3 : Bottom Left
plot(DATE,one,type="l",main="", xlab="", 
     ylab="Energy sub metering")
lines(DATE,two,col="red")
lines(DATE,three,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"), bty="n", cex=0.95)

# Plot 4 : Bottom Right
plot(DATE,GRP, type="l",main="",xlab="datetime",ylab="Global_reactive_power")

# close device
dev.off()

######### FIX LEGEND
