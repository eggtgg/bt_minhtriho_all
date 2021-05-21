setwd('F:\\R\\thuc_hanh_18_5_21')
Owls <- read.table('Owls.txt', sep = '\t', header = TRUE)
names(Owls)
Owls
str(Owls)
boxplot(Owls$NegPerChick)
par(mfrow=c(2,2), mar = c(3,3,2,1))
boxplot(NegPerChick ~ SexParent, data = Owls)
boxplot(NegPerChick ~ FoodTreatment, data = Owls)
boxplot(NegPerChick ~ SexParent* FoodTreatment,
        names = c(1,2,3,4),
        data = Owls)
boxplot(NegPerChick ~ Nest, data = Owls)

par(mar = c(2,2,3,3))
boxplot(NegPerChick ~ Nest,
        axes=FALSE,
        ylim=c(-3,8.5),
        data = Owls)
text(x=1:27, y=-2,
     labels= levels(Owls$Nest),
     cex=0.75, srt=65)
# 7.3 Boxplot sử dụng cho dữ liệu sinh vật biển RIKZ2.txt
# vẽ viểu đồ boxplot giữa
# Richness ~ Beach

RIKZ = read.table('RIKZ2.txt', header =TRUE)
RIKZ
boxplot(Richness ~ Beach, data = RIKZ)
