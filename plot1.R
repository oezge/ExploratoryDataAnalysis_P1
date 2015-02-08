
####  EXPLORATORY DATA ANALYSIS 
  ## This script is written for the Course Project 1
  
   
  # Reading and loading only the required part of data
  # It is assumed that the data is already downloaded and in the
  # working directory
  library(sqldf)
  data <- read.csv.sql("household_power_consumption.txt",
                               sql = 'Select * from file where Date = "1/2/2007"
                              OR  Date = "2/2/2007"', sep = ";")
  
  # Plotting the first figure
  par(bg = NA)
  hist(data$Global_active_power, col = 'red', main = NULL, xlab = NULL, 
       ylab = NULL)
  title(main = "Global Active Power", xlab = "Global Active Power(kilowatts)", 
        ylab = "Frequency")
  # Saving the figure
  dev.copy(png, file = "plot1", width = 480, height = 480)
  dev.off()