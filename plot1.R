#read in just a few rows of the table and then create a vector of classes from just the few rows. 
tab5rows <- read.table("household_power_consumption.txt", header = TRUE , sep = ";", na.strings ="?", nrows = 5)
classes <- sapply(tab5rows, class)
data <- read.table("household_power_consumption.txt", header = TRUE , sep = ";", na.strings ="?", colClasses = classes)
data<-na.omit(data)
 
data$Date<-as.Date(as.character(data$Date),"%d/%m/%Y")

dateMin <- as.character('2007-02-01')
dateMin <- as.Date(dateMin)
 
dateMax <- as.character('2007-02-02')
dateMax <- as.Date(dateMax)

sdata <- subset(data, as.Date(Date) >=  dateMin & as.Date(Date) <= dateMax )
 

hist(sdata$Global_active_power,
                 main   = "Global Active Power",
                 xlab   = "Global Active Power (kilowatts)",
                 ylab   = "Frequency", 
                 col    = "red",
                 border = "black")
 
dev.copy(png, file = "plot1.png", width = 480 , height=480)   
dev.off() 
