plot3 <- function() 
{
    # Read in the file and format the data
    dt <- read.table("household_power_consumption.txt", sep=";", header=TRUE, nrows=69516, 
                     colClasses="character")
    dt <- dt[66637:69516,]
    dt$Sub_metering_1 <- as.numeric(dt$Sub_metering_1)
    dt$Sub_metering_2 <- as.numeric(dt$Sub_metering_2)
    dt$Sub_metering_3 <- as.numeric(dt$Sub_metering_3)
    
    # Open the graphics device and create the plot
    png(file = "plot3.png")
    plot(strptime(paste(dt$Date,dt$Time),"%d/%m/%Y %H:%M:%S"), 
         dt$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(strptime(paste(dt$Date,dt$Time),"%d/%m/%Y %H:%M:%S"),
         dt$Sub_metering_2, col="red")
    lines(strptime(paste(dt$Date,dt$Time),"%d/%m/%Y %H:%M:%S"),
          dt$Sub_metering_3, col="blue")
    legend("topright", lwd = 1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
    #dt
}