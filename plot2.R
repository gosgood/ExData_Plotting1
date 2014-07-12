plot2 <- function() 
{
    # Read in the file and format the data
    dt <- read.table("household_power_consumption.txt", sep=";", header=TRUE, nrows=69516, 
                    colClasses="character")
    dt <- dt[66637:69516,]
    dt$Global_active_power <- as.numeric(dt$Global_active_power)
    
    # Open the graphics device and create the plot
    png(file = "plot2.png")
    plot(strptime(paste(dt$Date,dt$Time),"%d/%m/%Y %H:%M:%S"), 
         dt$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
    #dt
}
