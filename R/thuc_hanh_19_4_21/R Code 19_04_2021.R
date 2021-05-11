setwd("D:/R")
Veg <- read.table(file="Vegetation2.txt", header=TRUE)
str(Veg)
plot(Veg$BARESOIL,Veg$R)
plot(Veg$R, Veg$BARESOIL)
plot(x=Veg$BARESOIL, y=Veg$R)
plot(R~BARESOIL, data = Veg)
plot(x=Veg$BARESOIL, #bien x
     y=Veg$R, #bien y
     xlab="Exposed soil",  #tieu de cua x
     ylab = "Species richness", #tieu de cua y
     main="Scatter plot", #tieu de cua do thi
     xlim=c(0,45), #khoang gia tri cua x
     ylim=c(4,19))
plot(x=Veg$BARESOIL, #bien x
     y=Veg$R, #bien y
     xlab="Exposed soil",  #tieu de cua x
     ylab = "Species richness", #tieu de cua y
     main="Scatter plot", #tieu de cua do thi
     xlim=c(min(Veg$BARESOIL), max(Veg$BARESOIL)), #khoang gia tri cua x
     ylim=c(min(Veg$R), max(Veg$R))) #Khoang gia tri cua y
plot(x=Veg$BARESOIL, #bien x
     y=Veg$R, #bien y
     xlab="Exposed soil",  #tieu de cua x
     ylab = "Species richness", #tieu de cua y
     main="Scatter plot", #tieu de cua do thi
     xlim=c(min(Veg$BARESOIL), max(Veg$BARESOIL)), #khoang gia tri cua x
     ylim=c(min(Veg$R), max(Veg$R)), pch=8) #Khoang gia tri cua y
#mac dinh: bieu tuong - pch=1 - hinh tron
#pch=2: hinht tam giac


Veg$Transect
plot(x=Veg$BARESOIL, #bien x
     y=Veg$R, #bien y
     xlab="Exposed soil",  #tieu de cua x
     ylab = "Species richness", #tieu de cua y
     main="Scatter plot", #tieu de cua do thi
     xlim=c(min(Veg$BARESOIL), max(Veg$BARESOIL)),
     ylim=c(min(Veg$R), max(Veg$R)), pch=Veg$Transect)

Veg$Time
#N???u <=1980 thi cho bieu tuong pch=1
#N???u >1980 thi cho bieu tuong pch =10
TimeGroup <-Veg$Time
TimeGroup[Veg$Time<=1980] <- 1
TimeGroup[Veg$Time>1980] <- 10
plot(x=Veg$BARESOIL, #bi???n x
     y=Veg$R, #bi???n y
     xlab="Exposed soil",  
     ylab = "Species richness", 
     main="Scatter plot", 
     xlim=c(min(Veg$BARESOIL), max(Veg$BARESOIL)), 
     ylim=c(min(Veg$R), max(Veg$R)), pch=TimeGroup) 




plot(x=Veg$BARESOIL, 
     y=Veg$R, 
     xlab="Exposed soil",  
     ylab = "Species richness", 
     main="Scatter plot", 
     xlim=c(min(Veg$BARESOIL), max(Veg$BARESOIL)), 
     ylim=c(min(Veg$R), max(Veg$R)), pch=TimeGroup, col=3)


#tham so: col: color: 1- black
#2 - red
#3 - green


x<- 1:8
plot(x, col=x)


#dieu chinh kich thuoc cua symbols
CexSize <-Veg$Time
CexSize[Veg$Time<=1980] <- 1
CexSize[Veg$Time>1980] <- 2
plot(x=Veg$BARESOIL, 
     y=Veg$R, 
     xlab="Exposed soil",  
     ylab = "Species richness",
     main="Scatter plot",
     xlim=c(min(Veg$BARESOIL), max(Veg$BARESOIL)),
     ylim=c(min(Veg$R), 
            max(Veg$R)), 
     pch=TimeGroup, 
     col=1,
     cex=CexSize) 
veg1 <- loess(R~BARESOIL, data=Veg)
fit <- fitted(veg1)
lines(Veg$BARESOIL, fit)