plot4 <- function() 
{
    # Read in the file and format the data
    dt <- read.table("household_power_consumption.txt", sep=";", header=TRUE, nrows=69516, 
                     colClasses="character")
    dt <- dt[66637:69516,]
    dt$Global_active_power <- as.numeric(dt$Global_active_power)
    dt$Global_reactive_power <- as.numeric(dt$Global_reactive_power)
    dt$Voltage <- as.numeric(dt$Voltage)
    dt$Sub_metering_1 <- as.numeric(dt$Sub_metering_1)
    dt$Sub_metering_2 <- as.numeric(dt$Sub_metering_2)
    dt$Sub_metering_3 <- as.numeric(dt$Sub_metering_3)
    
    # Open the graphics device and create the plots
    png(file = "plot4.png")
    par(mfrow = c(2,2))
    
    # Global Active Power plot
    timevec <- strptime(paste(dt$Date,dt$Time),"%d/%m/%Y %H:%M:%S")
    plot(timevec, dt$Global_active_power, type="l", xlab="", 
         ylab="Global Active Power")
    
    #Voltage plot
    plot(timevec, dt$Voltage, type="l", xlab="datetime", ylab="Voltage")

    #Sub metering plot
    plot(timevec, dt$Sub_metering_1, type="l", xlab="", 
         ylab="Energy sub metering")
    lines(timevec, dt$Sub_metering_2, col="red")
    lines(timevec, dt$Sub_metering_3, col="blue")
    legend("topright", lwd = 1, bty = "n", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    #Global Reactive Power plot
    plot(timevec, dt$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
    
    dev.off()
    #dt
}