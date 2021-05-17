# dat thu muc
setwd('F:\\R\\thuc_hanh_14_5_21')

Veg = read.table('Vegetation2.txt', header = TRUE)
names(Veg)
str(Veg)

#Lay cac dia diem tu 6->9
Veg2 = Veg[,6:9]

Veg2

# Tao ham nhap vao 1 table va 1 lua chon
Index.function <-function(Veg2, Choice){
  # tinh so dia diem ma loai xuat hien
  if (Choice=="Richness") {
    Index <- rowSums(Veg2>0, na.rm = TRUE)
  }
  # tinh tong so ca the cua 1 loai
  if (Choice=="Total Abundance") {
    Index <- rowSums(Veg2, na.rm = TRUE)
  }
  # tinh chi so da dang loai
  if (Choice=="Shannon") {
    RS <- rowSums(Veg2, na.rm=TRUE)
    prop <- Veg2 / RS
    Index <- -rowSums(prop * log10(prop), na.rm= TRUE)
  }
  list(Index=Index, MyChoice= Choice)
}


Index.function(Veg2,"Richness")
Index.function(Veg2,"Total Abundance")
Index.function(Veg2,"Shannon")
