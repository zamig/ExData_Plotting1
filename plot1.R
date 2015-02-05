require(sqldf)

# To run the scrip the data file "household_power_consumption.txt" needs to be
# in the working diectory.
# The data can be download from  
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Loading the required dates from the data file
powerData <- read.csv2.sql("household_power_consumption.txt", 
                        sql = "select * from file where Date = '1/2/2007' or
                        Date = '2/2/2007'")

# Converting the 'Date' and 'Time' string columns to a column of dates.
dates <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")

# Creating the plot
png(filename = "plot1.png")
par(bg = NA)
hist(powerData$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()