getwd()
setwd("D:/R")
owls = read.table(file = 'Owls.txt', header = TRUE)
names(owls)
str(owls)
unique(owls$ï..Nest)
owls.ATV = owls[owls$Nest=="AutavauxTV",]
plot(x=owls.ATV$ArrivalTime,
     y=owls.ATV$NegPerChick,
     xlab = 'Arrival Time',
     main = 'Bieudo',
     ylab = 'Negotitation behaviour')


AllNexts = unique(owls$Nest)
for (i in 1:27) {
  nest.i = AllNexts[i]
  owls.i = owls[owls$Nest==nest.i,]
  yourfilename = paste(nest.i, '.jpg', sep = '')
  jpeg(file=yourfilename)
  plot(x=owls.i$ArrivalTime,
       y = owls.i$NegPerChick,
       xlab='Arrival Time',
       main=nest.i,
       ylab='Negotiation behaviour'
  )
  dev.off()
}
