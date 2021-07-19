# mergesort

# ý tưởng:
# 1. Tìm chỉ số nằm giữa mảng để chia mảng thành 2 nửa:
# 2. Gọi đệ quy hàm mergeSort cho nửa đầu tiên:   
# 3. Gọi đệ quy hàm mergeSort cho nửa thứ hai:
# 4. Gộp 2 nửa mảng đã sắp xếp ở (2) và (3):

# Hàm nối các mảng đã tách ra
mmerge<-function(a,b) {
  r<-numeric(length(a)+length(b))
  ai<-1; bi<-1; j<-1;
  for(j in 1:length(r)) {
    if((ai<=length(a) && a[ai]<b[bi]) || bi>length(b)) {
      r[j] <- a[ai]
      ai <- ai+1
    } else {
      r[j] <- b[bi]
      bi <- bi+1          
    }
  }
  r
}
# Hàm chia mảng để sắp xếp
mmergesort<-function(A) {
  if(length(A)>1) {
    q <- ceiling(length(A)/2)
    # đệ quy hàm mergeSort cho nửa đầu tiên
    a <- mmergesort(A[1:q])
    # đệ quy hàm mergeSort cho nữa thứ hai
    b <- mmergesort(A[(q+1):length(A)])
    mmerge(a,b)
  } else {
    A
  }
}
x<- sample(1:100)

mmergesort(x)
