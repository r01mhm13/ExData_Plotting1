#Assignment 1
#Reading only the two dates we will be using by referencing row numbers
file<-read.table("household_power_consumption.txt", skip=66637, nrows=2880, na.strings="?", sep=";")
#Create a new column that merges date and time into POSIXct format
file[,10] <- as.POSIXct(paste(file[,1],file[,2]), format="%d/%m/%Y %H:%M:%S")

#######
#plot3
######

#Open an empty plot 
plot(file[,10],file[,7],type="n", ylab="Energy sub metering",xlab="")
#Fill empty plot with lines for each variable
lines(file[,7]~file[,10], col="black")
lines(file[,8]~file[,10], col="red")
lines(file[,9]~file[,10], col="blue")
#Construct legend in the top right corner
legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )

dev.copy(png, file="plot3.png")
dev.off()
