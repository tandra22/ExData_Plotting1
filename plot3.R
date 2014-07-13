# Load data
path <- "household_power_consumption.txt"
myData <- read.table(path,header=TRUE,sep=";",colClasses="character")

# Convert to Date/Time clsases
myData[,1] <- as.Date(myData$Date,"%d/%m/%Y")

# Create a subset of the data between 2007-02-01 and 2007-02-02
subData <- subset(myData, myData$Date %in% as.Date(c("2007-02-01","2007-02-02")))

subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time), format="%Y-%m-%d %H:%M:%S")

# Cast the rest of the columns as numeric
subData[,3] <- as.numeric(subData[,3])
subData[,4] <- as.numeric(subData[,4])
subData[,5] <- as.numeric(subData[,5])
subData[,6] <- as.numeric(subData[,6])
subData[,7] <- as.numeric(subData[,7])
subData[,8] <- as.numeric(subData[,8])
subData[,9] <- as.numeric(subData[,9])

# Create plot 3
plot(subData$DateTime, subData[,7], type = "l", xlab = " ", ylab = "Energy sub metering")
lines(subData[,10], subData[,8], col = "Red")
lines(subData[,10], subData[,9], col = "Blue")
legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black","Red","Blue"), lwd = 1)

# Copy to PNG file for submission
dev.copy(png,file="plot3.png")

# Close device
dev.off()
