rm(list = ls())

#######################################################
## Reading, naming and subsetting data 
house_pow_cons <- read.table('household_power_consumption.txt', skip=1, sep = ';')
head(house_pow_cons)
names(house_pow_cons) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                           "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
str(house_pow_cons)

power <- subset(house_pow_cons, house_pow_cons$Date=="1/2/2007" | house_pow_cons$Date =="2/2/2007")
head(power)

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- strptime(power$Time, format="%H:%M:%S")
power[1:1440,"Time"] <- format(power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power[1441:2880,"Time"] <- format(power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# plotting
plot(power$Time,as.numeric(as.character(power$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")
