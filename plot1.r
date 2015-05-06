## Setting directory. uncomment and set yours
##setwd("C:/Users/Mahdi/Documents/GitHub/ExData_Plotting1")

#library Load
library(data.table)


#Data Load- Using ColClasses for quicker load
d<-read.table("household_power_consumption.txt",
              header=TRUE,sep=";",
              colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'), 
              na.strings="?")

#Filtering by string. This can be done later after conversion to date
#but I believe this is quicker as we dont have to run the conversion on big dataset
d<-filter(d,Date=="1/2/2007" | Date=="2/2/2007")

#added date conversion. no needed for plot1
d<-mutate(d,NewDate=as.Date(d$Date, "%d/%m/%Y"))

#drawing the histogram
hist(d$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
dev.copy(png,'plot1.png')
dev.off()