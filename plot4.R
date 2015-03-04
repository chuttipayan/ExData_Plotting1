power<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors=FALSE,na.strings="?",colClasses=c(rep("character",2), rep("numeric",7)))

plotdata<-power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]

plotdata$newdate <- paste(plotdata$Date," ",plotdata$Time)

plotdata$newdate <-strptime(plotdata$newdate,"%d/%m/%Y %H:%M:%S")

png(filename="plot4.png",width=480,height=480)

par(mfrow=c(2,2))

with(plotdata,plot(newdate,Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)"))

with(plotdata,plot(newdate,Voltage,type="l",xlab="datetime",ylab="Voltage"))


with(plotdata,{plot(newdate,Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
               
               
               
               lines(newdate,Sub_metering_2,col="red")
               lines(newdate,Sub_metering_3,col="blue")
})



legend("topright",lty=c(1,1,1),lwd=1,col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

with(plotdata,plot(newdate,Global_reactive_power,type="l",lwd="1",xlab="datetime"))

dev.off()
