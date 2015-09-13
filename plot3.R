library(data.table)
library(sqldf)

d = fread("household_power_consumption.txt")
d = as.data.frame(d)

dat = sqldf('select * from d where "Date" = "1/2/2007" or "Date" = "2/2/2007"')
names(dat) = c("date", "time", "globalActivePower","globalReactivePower", "voltage","globalIntensity", "submetering1", "submetering2", "submetering3")
x <- strptime(paste(dat$date, dat$time), "%d/%m/%Y %H:%M:%S")
a = as.numeric(dat$submetering1)
b = as.numeric(dat$submetering2)
c = as.numeric(dat$submetering3)

energy = cbind(dat$submetering1, dat$submetering2, dat$submetering3)

#x = wday(dmy(dat$date), label=TRUE)
y =  as.numeric(dat$globalActivePower)
png(file = "plot3.png")  


# set up the plot 
plot(x, a, type="n", xlab="",ylab = "Energy sub metering" ) 
colors = c(1,2,4) 
varnames = c("Submetering_1","Submetering_2","Submetering_3")
lines(x, a, lty=1, col=1) 
lines(x, b, lty=1, col=2) 
lines(x, c, lty=1, col=4) 

# add a legend 
legend("topright","(x,y)", varnames, cex=0.8, col=colors, lty=1)
dev.off()  



