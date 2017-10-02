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

#Plotting the 4 graphs on external png file
png(filename = "Plot4.png",width = 480,height = 480)

#Setting up plot area
par(mfrow = c(2,2),mar = c(4,4,1,1),oma = c(0,0,2,0))

#Plotting graph datetime and active power
with(feb_data,plot(Datetime,Global_active_power,type = "l"))

#Plotting graph datetime and voltage
with(feb_data,plot(Datetime,Voltage,type = "l",))

#Plotting graph datetime and energy sub metering
with(feb_data,plot(Datetime,Sub_metering_1,type = "n",xlab = "Datetime",ylab = "Energy Sub Metering"))
with(feb_data,points(x = Datetime,y = Sub_metering_1,type = "l",col = "black"))
with(feb_data,points(Datetime,Sub_metering_2,type = "l",col = "red"))
with(feb_data,points(Datetime,Sub_metering_3,type = "l",col = "blue"))
legend("topright",legend = c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),col = c("Black","Red","Blue"),lty = 1,cex = 0.52)

#Plotting graph datetime and reactive power 
with(feb_data,plot(Datetime,Global_reactive_power,type = "l"))
dev.off()



