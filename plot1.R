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

#basic plot function
hist(as.numeric(as.character(power$Global_active_power)),col="red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")
