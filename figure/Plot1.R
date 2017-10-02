##Setting Working Directory
setwd("C:/R/EDA/Week1")

#Importing data and checking the structure of the columns
all_data <- read.csv("C:/R/EDA/Week1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
str(all_data)

#Changing the date to readable format
all_data$Date <- as.Date(all_data$Date, format = "%d/%m/%Y")

#Subsetting for first two days of feb 2007
feb_data <- subset(all_data, Date == as.Date("2007-02-02") | Date == as.Date("2007-02-01"))
feb_data$Global_active_power <- as.numeric(feb_data$Global_active_power)

#Plotting the histogram on external device
png(filename = "Plot1.png",width = 480,height = 480)
with(feb_data,hist(Global_active_power,col = "red"))
dev.off()
