#read in just a few rows of the table and then create a vector of classes from just the few rows. 
tab5rows <- read.table("household_power_consumption.txt", header = TRUE , sep = ";", na.strings ="?", nrows = 5)
classes <- sapply(tab5rows, class)
data <- read.table("household_power_consumption.txt", header = TRUE , sep = ";", na.strings ="?", colClasses = classes)
data<-na.omit(data)
data$Date<-as.Date(as.character(data$Date),"%d/%m/%Y")
  
sapply(data, class) 
dateMin <- as.character('2007-02-01')
dateMin <- as.Date(dateMin)
 
dateMax <- as.character('2007-02-02')
dateMax <- as.Date(dateMax)

sdata <- subset(data, as.Date(Date) >=  dateMin & as.Date(Date) <= dateMax )
 

sdata <-  within(sdata, DateTime <- paste(sdata$Date, sdata$Time, sep=' '))
 
sdata$DateTime <- as.POSIXct(strptime(sdata$DateTime, "%Y-%m-%d %H:%M:%S"))
 
plot(sdata$DateTime ,sdata$Global_active_power, type = "n" ,
                 ylab   = "Global Active Power (kilowatts)",
                 xlab   = "" )
lines(sdata$DateTime ,sdata$Global_active_power, type="l") 
 

dev.copy(png, file = "plot2.png", width = 480 , height=480)   
dev.off() 

