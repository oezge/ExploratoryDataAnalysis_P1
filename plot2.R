
####  EXPLORATORY DATA ANALYSIS 
## This script is written for the Course Project 1


  # Reading and loading only the required part of data
  # It is assumed that the data is already downloaded and in the
  # working directory
  library(sqldf)
  data <- read.csv.sql("household_power_consumption.txt",
                     sql = 'Select * from file where Date = "1/2/2007"
                              OR  Date = "2/2/2007"', sep = ";")
 
  dateTime <- as.POSIXlt(paste(as.Date(data$Date,format = "%d/%m/%Y"), data$Time, 
                               sep = " "))
  
  # My systems local language is German,so in the x acis the abbreviations of weekdays
  # are German, I solved this issue with the following command
  
  loc <- Sys.getlocale("LC_TIME")
  dummy <- Sys.setlocale("LC_TIME", "C")
  
  # Plotting the second figure
  
  par(bg = NA)
  plot(dateTime,data$Global_active_power, type = "l", lty = 1, 
       ylab ="Global Active Power(kilowatts)",main = " ",
       xlab = "")
  
  # Saving the figure
  dev.copy(png, file = "plot2", width = 480, height = 480)
  dev.off()
  
  
  # Changing agian the timing of local system
  dummy <- Sys.getlocale("LC_TIME", loc)
