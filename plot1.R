# Load data
path <- "household_power_consumption.txt"
myData <- read.table(path,header=TRUE,sep=";",colClasses="character")

# Convert to Date/Time clsases
myData[,1] <- as.Date(myData$Date,"%d/%m/%Y")
myData[,2] <- as.Date(myData$Time,"%H/%M/%S")

# Create a subset of the data between 2007-02-01 and 2007-02-02
subData <- subset(myData, myData$Date %in% as.Date(c("2007-02-01","2007-02-02")))

# Cast the rest of the columns as numeric
subData[,3] <- as.numeric(subData[,3])
subData[,4] <- as.numeric(subData[,4])
subData[,5] <- as.numeric(subData[,5])
subData[,6] <- as.numeric(subData[,6])
subData[,7] <- as.numeric(subData[,7])
subData[,8] <- as.numeric(subData[,8])
subData[,9] <- as.numeric(subData[,9])

# Create Plot 1 
hist(subData[,3], col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Copy to PNG file for submission
dev.copy(png,file="plot1.png")

# Close device
dev.off()
