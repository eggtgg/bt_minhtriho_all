#5.3 Nhap hai data.frame thanh mot: merge
d = merge(d1, d2, by ="id", all = TRUE) #Dung bien so id lam chuan
d
#5.4 Bien doi so lieu (data coding)
bmd <- c(-0.92,0.21,0.17,-3.21,-1.80,-2.60,-2.00,1.71,2.12,-2.11)
#Tam thoi cho bien so diagnosis bang bmd
diagnosis = bmd
#Bien doi bmd thanh diagnosis
diagnosis[bmd <= -2.5] < -1
diagnosis[bmd > -2.5 & bmd <= 1.0] <-2
diagnosis[bmd > -1.0] <-3
#Tao thanh mot data.frame
data = data.frame(bmd, diagnosis)
#Liet ke de kiem tra xem lech co hieu qua khong
data
#5.5 Bien doi so lieu bang cach dung replace
diagnosis = bmd
diagnosis = replace(diagnosis,  bmd <= -2.5, 1)
diagnosis = replace(diagnosis, bmd > -2.5 & bmd <= 1.0, 2)
diagnosis = replace(diagnosis, bmd > -1.0, 3)
#5.6 Bien doi thanh yeu to (factor)
diag = factor(diagnosis)
diag
mean(diag) #NA
mean(diagnosis) #2.3
#5.7 Phan nhom so lieu bang cut2(Hmisc)
#Nhap thu vien Hmisc
library(Hmisc)
bmd <- c(-0.92,0.21,0.17,-3.21,-1.80,-2.60,-2.00,1.71,2.12,-2.11)
#Chia bien so bmd thanh 2 nhom va de trong doi tuong group
group = cut2(bmd, g=2)
table(group)
#Chia thanh 3 nhom
group = cut2(bmd, g=3)
group
#6. Su dung R cho tinh toan don gian
#6.1 Tinh toan don gian
#Cong 2 so voi nhau
15+2997
#Nhan va chia
-27*12/21
#Can bac 2
sqrt(10)
#Logarit
log(10)
#So mu e
exp(2.7689)
log10(2+3*pi)
#Vector
x <- c(2,3,1,5,4,6,7,6,8)
x
sum(x)
x*2
#Tinh tong binh phuong
x = c(1,2,3,4,5)
sum(x^2)
#Tinh sai so binh phuong
x <- c(1,2,3,4,5)
sum((x-mean(x))^2)/length(x)
#Phuong sai
x <- c(1,2,3,4,5)
var(x)
#Do lech chuan
sd(x)
#6.2 Su dung R cho cac phep tinh ma tran
y <- c(1,2,3,4,5,6,7,8,9)
A <- matrix(y, nrow=3)
A
#Nhung neu dung lenh
A <- matrix(y, nrow=3, byrow=TRUE)
A
#Ma tran chuyen vi dung t()
y <- c(1,2,3,4,5,6,7,8,9)
A <- matrix(y, nrow=3)
A
B <- t(A)
B
#Ma tran duong cheo
#Tao mot ma tran 3x3 voi tat ca phan tu la 0
A <- matrix(0, 3, 3)
A
#Cho cac pha tu duong cheo bang 1
diag(A) <- 1
diag(A)
A
#6.2.1 Chiet phan tu tu ma tran
y <- c(1,2,3,4,5,6,7,8,9)
A <- matrix(y, nrow=3)
#Cot 1 cua ma tran A
A[,1]
#Cot 3 cua ma tran A
A[,3]
#Dong 1 cua ma tran A
A[1,]
#Dong 2 cot 3 cua ma tran A
A[2,3]
#Tat ca cac dong cua ma tran A ngoai tru dong 2
A[-2,]
#Tat ca cac cot cua ma tran A ngoai tru cot 1
A[,-1]
#Xem phan tu nao lon hon 3
A>3
#6.2.2 Tinh toan voi ma tran
#Cong va Tru hai ma tran
A <- matrix(1:12, 3, 4)
A
B <- matrix(-1:-12, 3, 4)
B
#A + B
c = A+B
C
#A - B
D = A -B
D
#Nhan hai ma tran
y <- c(1,2,3,4,5,6,7,8,9)
A <- matrix(y, nrow=3)
B <- t(A)
AB <- A%*%B
AB
BA = B%*%A
BA
#Nghich dao ma tran va giai he phuong trinh
# 3x1 + 4x2 = 4
# x1 +6x2 = 2
A <- matrix(c(3,1,4,6), nrow=2)
Y <- matrix(c(4,2), nrow=2)
X <- solve(A)%*%Y
X
eigen(A)
$values
$vectors
#Tinh dinh thuc
E <- matrix((1:9), 3, 3)
E
det(E)
F = matrix((1:9)^2,3,3)
F
det(F)