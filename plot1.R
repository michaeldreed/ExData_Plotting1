# R Script file for creating plot 1

# Read the data in and subset to required dates
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                 na.strings=c("NA", "?"))
data<-subset(data, as.Date(data$Date, format="%d/%m/%Y")>="2007-02-01")
data<-subset(data, as.Date(data$Date, format="%d/%m/%Y")<="2007-02-02")

# Specify data for plot
GAP<-as.double(data$Global_active_power)

# Create PNG 
png(filename="plot1.png")

# Generate plot
hist(GAP, col="red", breaks=25, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

# close device
dev.off()