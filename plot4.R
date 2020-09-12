#code written by: monique-97
#Coursera Project: Exploratory Data Analysis Course
#2020-09-12

library(dplyr)

#change language
Sys.setlocale(category = "LC_ALL", locale = "english")

#read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

#take only complete data
data.filtred <- data[complete.cases(data),]

#filter by date
data.filtred <- data %>% filter(data$Date == "1/2/2007" | data$Date == "2/2/2007")

#create DateTime column
data.filtred$DateTime <- paste(data.filtred$Date, data.filtred$Time)
data.filtred$DateTime <- strptime(data.filtred$DateTime, "%d/%m/%Y %H:%M:%S")
#class(data.filtred$DateTime)


# fourth plot
png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(data.filtred$DateTime, data.filtred$Global_active_power, type = "l", xlab = "", ylab="Global Active Power")
plot(data.filtred$DateTime, data.filtred$Voltage, type = "l", xlab = "datetime", ylab="Voltage")

with(data.filtred, {
    plot(data.filtred$DateTime,data.filtred$Sub_metering_1, type="l", xlab ="", ylab = "Energy sub metering")
    lines(data.filtred$DateTime,data.filtred$Sub_metering_2, type="l", col = "Red")
    lines(data.filtred$DateTime,data.filtred$Sub_metering_3, type="l", col = "Blue")
    
})
legend("topright", col=c("black", "red", "blue"), lwd=c(2,2,2), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(data.filtred$DateTime, data.filtred$Global_reactive_power, type = "l", xlab = "datetime", ylab="Global_Reactive_Power")
dev.off()
