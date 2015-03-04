power<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors=FALSE,na.strings="?",colClasses=c(rep("character",2), rep("numeric",7)))

plotdata<-power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]

plotdata$newdate <- paste(plotdata$Date," ",plotdata$Time)

plotdata$newdate <-strptime(plotdata$newdate,"%d/%m/%Y %H:%M:%S")

png(filename="plot2.png",width=480,height=480)


with(plotdata,plot(newdate,Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)"))

dev.off()
