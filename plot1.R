file.info("household_power_consumption.txt")
poweruse<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
poweruse$Date<-as.Date(poweruse$Date,format="%d/%m/%Y")
d1<-as.Date("01/02/2007",format="%d/%m/%Y")
d2<-as.Date("02/02/2007",format="%d/%m/%Y")
powersub<-poweruse[poweruse$Date==d1|poweruse$Date==d2,]
powersub$Time<-as.POSIXct(powersub$Time,format="%H:%M:%S")
powersub$Global_active_power<-as.numeric(powersub$Global_active_power)

png(filename = "plot1.png",width = 480, height = 480, units = "px", bg = "white")
hist(powersub$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

