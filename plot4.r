#Assignment 1
#Reading only the two dates we will be using by referencing row numbers
file<-read.table("household_power_consumption.txt", skip=66637, nrows=2880, na.strings="?", sep=";")
#Create a new column that merges date and time into POSIXct format
file[,10] <- as.POSIXct(paste(file[,1],file[,2]), format="%d/%m/%Y %H:%M:%S")

######
#plot4
######

#Set parameters for multiple plots, 2x2 format 
par(mfrow=c(2,2))

#Code for constructing the four plots which are filled row-wise
with(file, {
  plot(file[,10],file[,3], type="l",ylab="Global Active Power(kilowatts)",xlab="")
  
  plot(file[,10],file[,5],type="l",ylab="Voltage",xlab="datetime")
  
  plot(file[,10],file[,7],type="n", ylab="Energy sub metering",xlab="")
  lines(file[,7]~file[,10], col="black")
  lines(file[,8]~file[,10], col="red")
  lines(file[,9]~file[,10], col="blue")
  legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
  
  plot(file[,10],file[,4],type="l", ylab="Global reactive power",xlab="datetime")
})

#Write to png
dev.copy(png, file="plot4.png")
dev.off()

