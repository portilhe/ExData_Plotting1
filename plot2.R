#Exploratory Data Analysis -- Course Project 1 -- Plot 2

#This script creates the plot 2

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
png(filename="plot2.png")

#Plot the data we want
with(my_data, plot(Date.Time, Global_active_power,
                   type="l",
                   xlab="",
                   ylab="Global Active Power (kilowatts)"))

#Close the graphics device
dev.off()

#Clean the workspace
rm(my_data)
