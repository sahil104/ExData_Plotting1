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

#Creating a combine date-time variable
feb_data$Datetime <- as.POSIXct(paste(feb_data$Date,feb_data$Time),format="%Y-%m-%d %H:%M:%S")

#Plotting the line graph of global active power and time on external png file
png(filename = "Plot3.png",width = 480,height = 480)
with(feb_data,plot(Datetime,Sub_metering_1,type = "n",xlab = "Datetime",ylab = "Energy Sub Metering"))
with(feb_data,points(x = Datetime,y = Sub_metering_1,type = "l",col = "black"))
with(feb_data,points(Datetime,Sub_metering_2,type = "l",col = "red"))
with(feb_data,points(Datetime,Sub_metering_3,type = "l",col = "blue"))
legend("topright",legend = c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),col = c("Black","Red","Blue"),lty = 1)
dev.off()



