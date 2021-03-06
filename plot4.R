require(sqldf)

# To run the scrip the data file "household_power_consumption.txt" needs to be
# in the working diectory.
# The data can be download from  
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Loading the required dates from the data file.
# Using "read.csv2.sql" to load only the needed dates.
# read.cvs.sql does not handle the missig values in the file
# but the given data and needed dates have no missing values
# and hence the use of this method does not cause any problem.
powerData <- read.csv2.sql("household_power_consumption.txt", 
                        sql = "select * from file where Date = '1/2/2007' or
                        Date = '2/2/2007'")

# Converting the 'Date' and 'Time' string columns to a column of dates.
dates <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")

# Creating the plot

png(filename = "plot4.png")

par(mfrow=c(2,2), bg = NA)

with(powerData, {
plot(dates, Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

plot(dates, Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage", )

plot(dates, Sub_metering_1, type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(dates, Sub_metering_2, col = "red")
lines(dates, Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"), bty = "n", cex = 0.91)

plot(dates, Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power", lwd = 0.8)
})
dev.off()