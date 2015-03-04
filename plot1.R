power<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".",stringsAsFactors=FALSE,na.strings="?",colClasses=c(rep("character",2), rep("numeric",7)))

plotdata<-power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]

png(filename="plot1.png",width=480,height=480)


with(plotdata,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)"))

dev.off()

