file.info("household_power_consumption.txt")
poweruse<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
p1<-as.Date(poweruse$Date,format="%d/%m/%Y")
d1<-as.Date("01/02/2007",format="%d/%m/%Y")
d2<-as.Date("02/02/2007",format="%d/%m/%Y")
powersub<-poweruse[p1==d1|p1==d2,]
datetime<-paste(powersub$Date,powersub$Time)
datetime<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")
powersub$Date<-datetime
powersub$Global_active_power<-as.numeric(powersub$Global_active_power)

png(filename = "plot2.png",width = 480, height = 480, units = "px", bg = "white")
plot(powersub$Date,powersub$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(powersub$Date,powersub$Global_active_power, type="l")
dev.off()
