#Giai Thua
# Tạo hàm nhận tham số là n
giai_thua <- function(n){
  # nếu n = 0 thì kết quả trả về là 1
  if(n == 0){
    return(1)
  } else {
    # ngược lại trả về (n* hàm vừa khỏi tạo với tham số n-1)
    # cho đến khi kết thúc bài toán (n=0)
    return(n*giai_thua(n-1))
  }
}
giai_thua(3)
