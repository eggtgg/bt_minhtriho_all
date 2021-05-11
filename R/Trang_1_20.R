#3."Van pham" R:
#Cu phap chung cua R: doi tuong = ham(thong so 1, thong so 2,..., thong so n)
#VD:
reg = lm(y ~ x) # reg la mot doi tuong (object), con lm la mot ham, va y ~ x la thong so cua ham
# Chinh noi luu file va doc file
setwd("D:/R")
# Thong so cua mot ham
args(lm)
# Mo phong 10 so lieu trong object x
x = rnorm(10)
# Mot so ki hieu hay dung trong R
x == 5 #x bang 5
x != 5 #x khong bang 5
y < x #y nho hon x
x > y #x lon hon y
z <= 7 #z nho hon hoac bang 7
p >= 1 #p lon hon hoac bang 1
is.na(x) #Co phai x la bien so khong (missing value)
A & B #A va B (AND)
A | B #A hoac B(OR)
#! Khong (NOT)
# Lenh nay se mo phong 10 gia tri normal
x = rnorm(10)
#3.1 Cach dat ten trong R
myobject = rnorm(10) #Dung
my object = rnorm(10) #Sai
my.object = rnorm(10) #Dung
# R phan biet chua Hoa va chu thuong
My.object.u = 15
my.object.L = 5
My.object.u + my.object.L # =20
# Khong nen dat ten mot bien so hay variable bang ki hieu "_" (underscore)
my_object # Sai
my-object # Sai
# Khong nen dat ten mot object giong nhu mot bien so trong mot du lieu
#3.2 Ho tro trong R
#Ngoai args() ta con co the su dung
help(lm)
#hay
?lm
#4. Cach nhap du lieu vao R
#4.1 Nhap so lieu truc tiep: c()
age = c(50, 62, 60, 40, 48, 47, 57, 70, 48, 67)
insulin = c(16.5,10.8,32.3,19.3,14.2,11.3,15.5,15.8,16.2,11.2)
# Tao dataframe
tuan = data.frame(age, insulin)
tuan
#save file theo dang R trong thu muc da setwd()
save(tuan, file = "tuan.rda")
#4.2 Nhap so lieu truc tiep: edit(data.frame())
ins = edit(data.frame())
ins
#4.3 Nhap so lieu ti mot text file: read.table
chol = read.table("chol.txt", header = TRUE)
chol
#Xem ten cot
names(chol)
#Save file
save(chol, file = "chol.rda")
#4.4 Nhap so lieu tu Excel: read.csv
gh = read.csv("excel.csv", header = TRUE)
#4.5 Nhap so lieu tu mot SPSS: read.spss
#Truy cap foreign bang lenh library
library(foreign)
testo = read.spss("testo.sav", to.data.frame = TRUE)
#4.6 Thong tin ve du lieu
attach(chol)
#Kiem tra chol co phai la mot data.frame khong bang lenh is.data.frame(arg)
is.data.frame(chol) # TRUE
#Co bao nhieu dong va cot
dim(chol) # 50 8
#Xem ten cot
names(chol)
#Trong bien sex co bao nhieu nam va nu
table(sex) # nam 1 Nam 21 Nu 28
#4.7 Tao day so bang ham seq, rep va gl
# Ap dung seq
#Tao mot vector so tu 1 den 12
x = (1:12)
x
#Su dung seq
seq(12)
#Tao mot vector so tu 12 den 5
x = (12:5)
x
#Su dung seq
seq(12:5)
#Cong thuc chung cua ham seq la seq(from, to, by=)
#hay seq(from, to, length.out= )
#Tao ra mot vector tu 4 den 6 voi khoang cach bang 0.25
seq(4, 6, 0.25)
#Tao ra mot vector 10 so voi so nho nhat la 2 va lon nhat la 15
seq(length = 10, from=2, to=15)
# Ap dung rep
# Cong thuc ham rep la rep(x, times, ...), x la mot bien so va times la so lan lap lai
#Tao ra so 10, 3 lan:
rep(10, 3)
#Tao ra so 1 den 4, 3 lan:
rep((1:4), 3)
#Tao ra so 1.2, 2.7, 4.5, 5 lan:
rep(c(1.2, 2.7, 4.5), 5)
# Ap dung gl
# Tao bien thu bac
# Cong thuc chung gl(n, k, length = n*k, labels = 1:n, ordered = FALSE)
#Tao ra bien gom bac 1 va 2, moi bac lap lai 8 lan
gl(2, 8)
#Mot bien bac 1,2,3, moi bac lap lai 8 lan
gl(3, 8)
#Tao ra bien gom bac 1 va 2, moi bien lap lai 10 lan (do do length = 20)
gl(2,10, length = 20)
#hay
gl(2,2,length = 20)
#Cho them ki hieu
gl(2,5, labels = c("C","T"))
#Tao ra mot bien gom bac 1,2,3,4. Moi bac lap lai 2 lan
rep(1:4, c(2,2,2,2))
#Tuong duong voi
rep(1:4, each = 2)
#Voi ngay gio thang
x = .leap.seconds[1:3]
rep(x, 2)
rep(as.POSIXct(x), rep(2,3))
#5 Bien tap so lieu
#5.1 Tach roi du lieu: subset
chol = read.table("chol.txt", header = TRUE)
attach(chol)
# Cu phap: subset(data, cond) trong do data la data.frame ma chung ta muon tach roi, cond la dieu kien
#Tach ra 2 bien nam, nu
nam = subset(chol, sex =="Nam")
nu = subset(chol, sex =="Nu")
#Tach ra nguoi co tuoi tu 60 tro len
old = subset(chol, age>=60)
dim(old)
# Mot data.frame voi nhung benh nhan tren 60 tuoi va nam gioi
n60 = subset(chol, age>=60 & sex=="Nam")
dim(n60)
#5.2 Chiet so lieu tu mot data.frame
#Chon cot so 1,3,7
data2 = chol[, c(1,3,7)]
#Chon 10 dong dau tien cua cot so 1,3,7
data3 = chol[1:10, c(1,3,7))
print(data3)