df <- read.csv("household_power_consumption.txt", sep = ";")
df1 <- subset(df, df$Date=="1/2/2007"|df$Date=="2/2/2007")
df1$Date <- as.Date(df1$Date, format="%d/%m/%Y")
df1$Time <- strptime(df1$Time, format = "%H:%M:%S")
df1[1:1440,"Time"] <- format(df1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
df1[1441:2880,"Time"] <- format(df1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##plot1

hist(as.numeric(as.character(df1$Global_active_power)),col = "red", xlab="Global Active Power(kilowatts)", main="Global Active Power")

##plot2

plot(df1$Time, as.numeric(as.character(df1$Global_active_power)), xlab = " ", ylab = "Global Active Power(kilowatts)", type="l")

##plot3

plot(df1$Time, df1$Sub_metering_1, xlab = "", ylab = "Energy Sub Metering", type="n")
with(df1, lines(Time, as.numeric(as.character(Sub_metering_1))))
with(df1, lines(Time, as.numeric(as.character(Sub_metering_2)), col="red"))
with(df1, lines(Time, as.numeric(as.character(Sub_metering_3)), col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty =2)

##plot4

par(mfrow=c(2,2), mar=c(2,2,2,2))
with(df1,{
        plot(df1$Time, df1$Global_active_power, xlab = " ", ylab = "Global Active Power", type = "l")
        plot(df1$Time, df1$Voltage, xlab = "datetime", ylab = "Voltage", type="l")
        plot(df1$Time, df1$Sub_metering_1, type="n", ylab = "Energy sub metering")
        with(df1, lines(Time, as.numeric(as.character(Sub_metering_1))))
        with(df1, lines(Time, as.numeric(as.character(Sub_metering_2)), col="red"))
        with(df1, lines(Time, as.numeric(as.character(Sub_metering_3)), col="blue"))
        
        plot(df1$Time, df1$Global_reactive_power, xlab = "datetime", type="l")
})