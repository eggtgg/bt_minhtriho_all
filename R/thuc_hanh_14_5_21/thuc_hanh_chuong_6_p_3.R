setwd('F:\\R\\thuc_hanh_14_5_21')
Benthic = read.table('RIKZ.txt', header = TRUE)
names(Benthic)
str(Benthic)
Species = Benthic[,2:76]
Species
names(Species)
str(Species)
# kiểm tra dimenstions -  chiều của biến Species
n = dim(Species)
n # số dòng số cột
# 45 dòng tương ứng với 45 sites- vị trí thu thập mẫu vật
# Tương ứng với mỗi vị trí thì sẽ ghi nhận được voi nhung loai sinh vat bien nao
# co bao nhieu loai sinh vat bien o vi tri 1
sum(Species[1,], na.rm = TRUE)
# ket qua 143 loai sinh vat bien xuat hien o site 1
sum(Species[2,], na.rm = TRUE)
# ... lam 45 lan de kiem tra so luong sinh vatbien xuat hien tai cac sites
TA <- vector(length = n[1])
for (i in 1:n[1]) {
  TA[i] <- sum(Species[i,], na.rm =TRUE)
}
TA


TA02 <- rowSums(Species, na.rm = TRUE)
TA02


# di vao chi tiet tai tung vi tri quan sat
sum(Species[1,]>0, na.rm = TRUE)
#ket qua chung ta co 11 loai khac nhau cuat hien


Richness <- vector(length=n[1])
for (i in 1:n[1]) {
  Richness[i] <- sum(Species[i,]>0, na.rm =TRUE)
}
Richness

Richness02 =  rowSums(Species>0, na.rm = TRUE)
Richness02


# chi so da dang loai



RS = rowSums(Species, na.rm=TRUE)
prop <-  Species/RS
H <- -rowSums(prop * log10(prop), na.rm =TRUE)
H

# kết hợp lại hết những gì đã làm vô 1 hàm của riêng mình
# để sau này sử dụng lại để phân tích những dữ liệu tương tự

Choice <- 'Richness'
Index.function <- function(Spec, Choice){
  if (Choice=='Richness') {
    Index = rowSums(Species>0, na.rm =TRUE)
  }
  if (Choice=="Total Abundance") {
    Index = rowSums(Species, na.rm = TRUE)
  }
  if (CHoice=="shannon") {
    RS =  rowSums(Species, na.rm = TRUE)
    prop <- Species /RS
    Index = -rowSums(prop * log10(prop), na.rm =TRUE)
  }
  list(Index=Index, MyChoice= Choice)
}


