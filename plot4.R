file.info("household_power_consumption.txt")
poweruse<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
p1<-as.Date(poweruse$Date,format="%d/%m/%Y")
d1<-as.Date("01/02/2007",format="%d/%m/%Y")
d2<-as.Date("02/02/2007",format="%d/%m/%Y")
powersub<-poweruse[p1==d1|p1==d2,]
datetime<-paste(powersub$Date,powersub$Time)
datetime<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")
powersub$Date<-datetime
powersub$Sub_metering_1<-as.numeric(powersub$Sub_metering_1)
powersub$Sub_metering_2<-as.numeric(powersub$Sub_metering_2)
powersub$Sub_metering_3<-as.numeric(powersub$Sub_metering_3)
powersub$Global_active_power<-as.numeric(powersub$Global_active_power)
powersub$Global_reactive_power<-as.numeric(powersub$Global_reactive_power)
powersub$Voltage<-as.numeric(powersub$Voltage)

png(filename = "plot4.png",width = 480, height = 480, units = "px", bg = "white")
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))
plot(powersub$Date,powersub$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(powersub$Date,powersub$Global_active_power, type="l")

plot(powersub$Date,powersub$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(powersub$Date,powersub$Voltage, type="l")

plot(powersub$Date,powersub[,7],type="n",xlab="",ylab="Energy sub metering")
clr<-c("black","red","blue")
for (i in 1:3){
  lines(powersub$Date,powersub[,6+i],col=clr[i],type="l")
}
legend("topright", legend = colnames(powersub[,7:9]), box.lty=0,inset=0.005, col=clr, lwd=1)

plot(powersub$Date,powersub$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(powersub$Date,powersub$Global_reactive_power, type="l")
dev.off()