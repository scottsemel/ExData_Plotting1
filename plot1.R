
library(data.table)
library(sqldf)

d = fread("household_power_consumption.txt")
d = as.data.frame(d)
names(d) = c("date", "time", "globalActivePower","globalReactivePower", "voltage","globalIntensity", "submetering1", "submetering2", "submetering3")

x = sqldf('select * from d where "date" = "1/2/2007" or "date" = "2/2/2007"')

h =  as.numeric(x$globalActivePower)
png(file = "plot1.png")  
hist(h,12, xlab = "Global Active Power (killowatts)", main = "Global Active Power", col = 2)
dev.off()  








