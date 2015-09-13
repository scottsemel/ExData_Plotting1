library(data.table)
library(sqldf)

d = fread("household_power_consumption.txt")
d = as.data.frame(d)
dat = sqldf('select * from d where "Date" = "1/2/2007" or "Date" = "2/2/2007"')
names(dat) = c("date", "time", "globalActivePower","globalReactivePower", "voltage","globalIntensity", "submetering1", "submetering2", "submetering3")
x = strptime(paste(dat$date, dat$time), "%d/%m/%Y %H:%M:%S")
y =  as.numeric(dat$globalActivePower)
par(mfrow=c(2,2))
#layout(mat, widths=rep(1, ncol(mat)), heights=rep(1, ncol(mat)))
png(file = "plot4.png")  

# Fig 1

plot(x, y, type="n", xlab="", ylab = "Global Active Power (killowatts)") 
lines(x,y)

# Fig 2

datetime = x
dat = cbind(dat,datetime)
names(dat) = c("date", "time", "globalActivePower","globalReactivePower", "voltage","globalIntensity", "submetering1", "submetering2", "submetering3", "datetime")
z = dat$voltage
plot(datetime, z, type="n", ylab = "Voltage") 
lines(x, z)


# Fig 3

a = as.numeric(dat$submetering1)
b = as.numeric(dat$submetering2)
c = as.numeric(dat$submetering3)
energy = cbind(dat$submetering1, dat$submetering2, dat$submetering3)
plot(x, a, type="n", xlab="",ylab = "Energy sub metering" ) 
colors = c(1,2,4) 
lines(x, a, lty=1, col=1) 
lines(x, b, lty=1, col=2) 
lines(x, c, lty=1, col=4) 

legend("topright","(x,y)", varnames, cex=0.8, col=colors, lty=1)

# Fig 4

v = dat$globalReactivePower
plot(datetime, v, type="n", ylab = "Global_reactive_power") 
lines(x, v)

dev.off()  



