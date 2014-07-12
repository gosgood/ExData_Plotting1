plot1 <- function() 
{
    # Read in the file and format the data
    dt <- read.table("household_power_consumption.txt", sep=";", header=TRUE, nrows=69516, colClasses="character")
    dt <- dt[66637:69516,]
    dt$Global_active_power <- as.numeric(dt$Global_active_power)
    
    # Open the graphics device and create the plot
    png(file = "plot1.png")
    hist(dt$Global_active_power, main = "Global Active Power", col= "red", xlab = "Global Active Power (kilowatts)")
    dev.off()
    
    #dt
}
    