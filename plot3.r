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
png(width=480,height=480,file="plot3.png")
plot(d$NewDateWithTime,d$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(d$NewDateWithTime,d$Sub_metering_1,col="black")
lines(d$NewDateWithTime,d$Sub_metering_2,col="red")
lines(d$NewDateWithTime,d$Sub_metering_3,col="blue")

#Adding Legend
legend("topright",pch=NA,col=c("black","red","blue"),legend=c("Sub_metering1","Sub_metering2","Sub_metering3"),lwd=1)

#dev.copy(png,'plot3.png') 
# I didnt use the above method as the end of legend is being trimmed
# this happens during the export so I use writing to PNG directly

dev.off()