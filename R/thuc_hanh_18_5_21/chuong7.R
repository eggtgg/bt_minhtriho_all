setwd('F:\\R\\thuc_hanh_18_5_21')
#Chương 5 => plot => biểu đồ dạng x, y
#Thêm một số tool cho vẽ biểu đồ
#Phân tích dữ liệu
#7.1. Pie chart
#H5N1 Avian Infuenza A => WHO World Health Organization
BFCases <- read.table(file = "BirdFluCases.txt", sep="\t", header = TRUE)
#Phân cách giữa các cột dữ liệu chúng ta là tab tham số: sep="\t"
names(BFCases)
str(BFCases)
#Thao tác thống kê số case the năm
Cases <- rowSums(BFCases[,2:16])
names(Cases)<-BFCases[,1]
Cases
#Vẽ biểu đồ pie chart
#. Biểu đồ chuẩn - standard pie chart
#Dùng để chia màn hình
par(mfrow= c(1,4), mar= c(3,3,2,1))
# mflrow = c(1,4) xep bang do thanh 1 hang 4 cot
# mar = c(3,3,2,1): khoang trang cua

pie(Cases, main = "Standard pie chart")
pie(Cases, main = "Grey color",
    col = gray(seq(0.4, 1.0, length=6)),
    clockwise = TRUE
)
pie(Cases, main = "Rainbow color",
    col = rainbow(6),
    clockwise = TRUE
)

rm()
op <- par(mfrow= c(2,2), mar= c(3,3,2,1))
pie(Cases, main = "Standard pie chart")
pie(Cases, main = "Grey color",
    col = gray(seq(0.4, 1.0, length=6)),
    clockwise = TRUE
)
pie(Cases, main = "Rainbow color",
    col = rainbow(6),
    clockwise = TRUE
)
pie3D(Cases, main = "3D Pie Chart",
      explode=0.1,
      labels = names(Cases),
      labelcex=0.6,
)
par(op)


#7.2 Bar chart and Strip Chart
BFDeaths =  read.table(file="BirdFluDeaths.txt", sep ='\t', header = TRUE)
Deaths =  rowSums(BFDeaths[,2:16])
names(Deaths) =  BFDeaths[,1]
Deaths
str(Deaths)


# Chia màn hình là 4 phần 2x2
par(mfrow=c(2,2), mar= c(3,3,2,1))


barplot(Cases, main='Bird Flu Cases')
barplot(Deaths, main= 'Death')
Counts = cbind(Cases, Deaths)
Counts
barplot(Counts)
barplot(t(Counts), col=gray(c(0.5,1)))
barplot(t(Counts), beside =TRUE)





#Sử dụng hàm merge để nối 2 data.frame lại với nhau
#Sử dụng hàm write.table(dataframe, file="tên mới.txt",...)
#Sử dụng 2 hàm trên ứng dụng cho dataset RIKZ.txt
# Biến thành một dataset RIKZ_A.txt có chứa các cột
#Sample, Richness, Shannon
Benthic <-read.table(file="RIKZ2.txt", header=TRUE)
Bent.M <-tapply(Benthic$Richness, 
                INDEX=Benthic$Beach, 
                FUN=mean)
Bent.sd <-tapply(Benthic$Richness, 
                 INDEX=Benthic$Beach, 
                 FUN=sd)
MSD <- cbind(Bent.M, Bent.sd)
MSD
barplot(Bent.M)


bp <- barplot(Bent.M, xlab="Beach",
              ylim = c(0,20),
              ylab="Richness",
              col=rainbow(9)
)
arrows(bp, Bent.M, 
       bp, Bent.M+Bent.sd,
       lwd=1.5,
       angle=90,
       length=0.1
)
box()


Benth.le <- tapply(Benthic$Richness,
                   INDEX=Benthic$Beach,
                   FUN=length)
#se= standard error= 
#standard deviation/square root of the sample size
#
Bent.se <- Bent.sd/sqrt(Benth.le)
Bent.se
#STRIP CHART


stripchart(Benthic$Richness~Benthic$Beach,
           vert=TRUE,
           pch=1,
           method="jitter",
           jit=0.05,
           xlab="Beach",
           ylab="Richness")
points(1:9, Bent.M, pch=16,
       cex=1.5)
arrows(1:9, Bent.M,
       1:9, Bent.M+Bent.se,
       lwd=1.5,
       angle=90,
       length = 0.1)
arrows(1:9, Bent.M,
       1:9, Bent.M-Bent.se,
       lwd=1.5,
       angle=90,
       length = 0.1)

