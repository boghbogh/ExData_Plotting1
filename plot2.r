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

#added date & time conversion. 
d<-mutate(d,NewDateWithTime=as.POSIXct(strptime(paste(d$Date,"",d$Time), "%d/%m/%Y%H:%M:%S")))

#drawing the histogram
plot(d$NewDateWithTime,d$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(d$NewDateWithTime,d$Global_active_power)
dev.copy(png,'plot2.png')
dev.off()