setwd('F:\\R\\thuc_hanh_18_5_21')
BFD = read.table('BirdFluDeaths.txt', header = TRUE, sep ='\t')
BFD
BFD[,2:16]
BFDC = rowSums(BFD[,2:16])
names(BFDC) = BFD$Year
BFDC
pie(BFDC, main = 'BFDCount',
    col = rainbow(6),
    clockwise = TRUE
)
BFDCC = colSums(BFD[,2:16])
BFDCC
names(BFDCC)
pie(BFDCC, main = 'BFDCountCountry')

Veg = read.table('Vegetation2.txt', header = TRUE)
Veg
Veg.M = tapply(Veg$R, INDEX = Veg$Transect,
               FUN = mean)
Veg.M
Veg.sd = tapply(Veg$R, INDEX = Veg$Transect,
                FUN = sd)
Veg.sd
Veg.le = tapply(Veg$R, INDEX = Veg$Transect,
                FUN = length)
Veg.le
Veg.se = Veg.sd / sqrt(Veg.le)
Veg.se
stripchart(Veg$R~Veg$Transect,
           vert=TRUE,
           pch=1,
           method="jitter",
           jit=0.05,
           xlab="Transect",
           ylab="Richness")
points(1:8, Veg.M, pch=16,
       cex=1.5)
arrows(1:9, Veg.M,
       1:9, Veg.M+Veg.se,
       lwd=1.5,
       angle=90,
       length = 0.1)
arrows(1:9, Veg.M,
       1:9, Veg.M-Veg.se,
       lwd=1.5,
       angle=90,
       length = 0.1)

