setwd('F:\\R\\file')
Owls = read.table('Owls.txt', header = TRUE)
Allnests = unique(Owls$Nest)
for (i in 1:length(Allnests)){
  print(Allnests[i])
  Owls.i = Owls[Owls$Nest==Allnests[i],]
  #filename = paste(Allnests[i],'.jpg', sep='')
  jpeg(file = filename)
  plot(x = Owls.i$SiblingNegotiation, y = Owls.i$ArrivalTime,
       xlab = 'SiblingNegotiation', ylab= 'ArrivalTime',
       main = Allnests[i])
  #dev.off()
}
