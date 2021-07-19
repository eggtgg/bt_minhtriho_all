# sap xep chon
# Tạo ngẫu nhiên một list lộn xộn từ 1_100
vec <- sample(1:100)
vec

# Ý tưởng:
# Bước 1: i=1.
# Bước 2: Tìm phần tử a[min] nhỏ nhất trong dãy hiện hành từ a[i] đến a[n].
# Bước 3: Hoán vị a[min] và a[i]
# Bước 4: Nếu i<=n-1 thì i=i+1; Lặp lại bước 2.
# Ngược lại: Dừng. n-1 phần tử đã nằm đúng vị trí.

# tạo hàm nhận tham số:
# x: là một list cần được sắp xếp
#
sort <- function(x) {
  n<- length(x)
  for (i in 1:(n-1)) {
    for (j in (i+1):n) {
      if(x[j] < x[i]) {
        temp <-x[i]
        x[i] <- x[j]
        x[j] <- temp
      }
    }
  }
  return(x)
}
sort(vec)

# tương tự cách giải trên nhưng sử dụng đệ quy
selfsort <- function(x) {
  if (length(x)>1) {
    min <- which.min(x)
    c(x[min], selfsort(x[-min]))
  } else x
}
selfsort(vec)
