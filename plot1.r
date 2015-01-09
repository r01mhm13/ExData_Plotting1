#Assignment 1
#Reading only the two dates we will be using by referencing row numbers
file<-read.table("household_power_consumption.txt", skip=66637, nrows=2880, na.strings="?", sep=";")
#Create a new column that merges date and time into POSIXct format
file[,10] <- as.POSIXct(paste(file[,1],file[,2]), format="%d/%m/%Y %H:%M:%S")

######
#plot1
######

hist(file[,3], main= "Global Active Power", xlab= "Global Active Power(kilowatts)", col="red")
dev.copy(png, file="plot1.png")
dev.off()