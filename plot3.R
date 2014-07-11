#Exploratory Data Analysis -- Course Project 1 -- Plot 3

#This script creates the plot 3

#Read the data from file
my_data <- read.csv2("household_power_consumption.txt",
                     dec=".",
                     colClasses=c(rep("character",2),rep("numeric",7)),
                     na.strings=c("NA",""," ","?"))

#Keep only the data from the dates we are interested in: 1/2/2007 and 2/2/2007
my_data <- my_data[my_data$Date=="1/2/2007" | my_data$Date=="2/2/2007",]

#Make time objects from the first two columns of the data set and replace
#the Time column with these objects
my_data$Time <- strptime(mapply(paste,
                                my_data$Date,
                                my_data$Time,
                                collapse=" "),
                         format="%d/%m/%Y %H:%M:%S")

#Rename the second column and get rid of the first colunm
colnames(my_data)[2] <- "Date.Time"
my_data <- my_data[,-1]

#Set up the graphics device
png(filename="plot3.png")

#Plot the data we want
with(my_data,plot(Date.Time, Sub_metering_1,
                  type="n",
                  ylab="Energy sub metering",
                  xlab=""))
with(my_data,points(Date.Time, Sub_metering_1, type="l"))
with(my_data,points(Date.Time, Sub_metering_2, type="l", col="red"))
with(my_data,points(Date.Time, Sub_metering_3, type="l", col="blue"))
legend("topright",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

#Close the graphics device
dev.off()

#Clean the workspace
rm(my_data)
