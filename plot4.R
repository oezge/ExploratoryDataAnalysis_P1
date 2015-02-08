  ####  EXPLORATORY DATA ANALYSIS 
  ## This script is written for the Course Project 1


  # Reading and loading only the required part of data
  # It is assumed that the data is already downloaded and in the
  # working directory
  library(sqldf)
  library(dplyr)
  data <- read.csv.sql("household_power_consumption.txt",
                     sql = 'Select * from file where Date = "1/2/2007"
                     OR  Date = "2/2/2007"', sep = ";")

  dateTime <- as.POSIXlt(paste(as.Date(data$Date,format = "%d/%m/%Y"), data$Time, 
                             sep = " "))

  # My systems local language is German,so in the x acis the abbreviations of weekdays
  # are German, I solved this issue with the following command
  
  loc <- Sys.getlocale("LC_TIME")
  dummy <- Sys.setlocale("LC_TIME", "C")
  
  # Plotting the fourth figure
    # First an empty png file is created
  png(file = "plot4.png")
    # Determining the properties of figures
  par(mfrow = c(2,2))
  par(bg = NA)
  
    #  1st column 1 st row
  
    plot(dateTime, data$Global_active_power, type = "l", lty = 1, xlab = "",
         main = "", ylab = "Global_active_power")
      
    #  2nd column 1st row
  
    plot(dateTime,data$Voltage, type = "l", lty = 1, 
       ylab ="Voltage",main = "",
       xlab = "datetime")
  
    #  1st columns 2nd row

    plot(dateTime,data$Sub_metering_1, type = "l", lty = 1, 
       ylab ="Energy_sub_metering",main = "",
       xlab = "")
    lines(dateTime, data$Sub_metering_2,col = "red")
    lines(dateTime, data$Sub_metering_3,col = "blue")
    legend("topright", lty = c(1,1,1), col = c("black","red","blue"), 
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    #  2nd column, 2nd row
    plot(dateTime,data$Global_reactive_power, type = "l", lty = 1, 
       ylab ="Global_reactive_power",main = "",
       xlab = "datetime")
  
  # Closing the opened document
  dev.off()
  
  # Changing agian the timing of local system
  dummy <- Sys.getlocale("LC_TIME", 'loc')
  