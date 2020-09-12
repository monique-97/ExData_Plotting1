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

# first plot
png(filename = "plot1.png")
hist(data.filtred$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

