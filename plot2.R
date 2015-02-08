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

png(filename = "plot2.png")
par(bg = NA)
plot(dates, powerData$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
