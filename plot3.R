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

# third plot
png(filename = "plot3.png")
with(data.filtred, {
    plot(data.filtred$DateTime,data.filtred$Sub_metering_1, type="l", xlab ="", ylab = "Energy sub metering")
    lines(data.filtred$DateTime,data.filtred$Sub_metering_2, type="l", col = "Red")
    lines(data.filtred$DateTime,data.filtred$Sub_metering_3, type="l", col = "Blue")
    
})
legend("topright", col=c("black", "red", "blue"), lwd=c(2,2,2), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

