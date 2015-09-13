library(data.table)
library(sqldf)


d = fread("household_power_consumption.txt")
d = as.data.frame(d)

dat = sqldf('select * from d where "Date" = "1/2/2007" or "Date" = "2/2/2007"')

names(dat) = c("date", "time", "globalActivePower","globalReactivePower", "voltage","globalIntensity", "submetering1", "submetering2", "submetering3")
x = strptime(paste(dat$date, dat$time), "%d/%m/%Y %H:%M:%S")
y =  as.numeric(dat$globalActivePower)
png(file = "plot2.png")  
plot(x, y, type="n", xlab="", ylab = "Global Active Power (killowatts)") 
lines(x,y)
dev.off()  

