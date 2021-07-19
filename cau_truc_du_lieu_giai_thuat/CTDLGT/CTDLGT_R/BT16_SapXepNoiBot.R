#sap xep noi bot

# Ý tưởng:
# lặp lại công việc đổi chỗ 2 số liên tiếp nhau nếu chúng đứng
# sai thứ tự(số sau bé hơn số trước với trường hợp sắp xếp tăng dần)
# cho đến khi dãy số được sắp xếp.

# tạo một vector cần sắp xếp
vec = c(1,-1,3,2,10,9)

# tạo hàm với tham số x là một list cần sắp xếp
bubble <- function(x){
  n<-length(x)
  # so sánh từng 2 số một liền kề
  for(j in 1:(n-1)){
    for(i in 1:(n-j)){
      if(x[i]>x[i+1]){
        temp<-x[i]
        x[i]<-x[i+1]
        x[i+1]<-temp
      }
    }
  }
  return(x)
}
bubble(vec)
