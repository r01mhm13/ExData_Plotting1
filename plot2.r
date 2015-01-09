#Assignment 1
#Reading only the two dates we will be using by referencing row numbers
file<-read.table("household_power_consumption.txt", skip=66637, nrows=2880, na.strings="?", sep=";")
#Create a new column that merges date and time into POSIXct format
file[,10] <- as.POSIXct(paste(file[,1],file[,2]), format="%d/%m/%Y %H:%M:%S")

######
#plot2
######

plot(file[,10],file[,3], type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.copy(png, file="plot2.png")
dev.off()