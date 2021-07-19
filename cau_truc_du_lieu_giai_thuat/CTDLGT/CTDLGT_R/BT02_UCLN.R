# tạo hàm nhập vào 2 tham số a và b nguyen
ucln <- function(a, b){
  # nếu b= 0 thì UCLN sẽ bằng đúng a
  if(b == 0){
    return(a)
    # ngược lại thì sẽ gọi lại hàm ucln
    # cho đến khi bài toán được giải quyết khi (b=0)
  } else {
    return(ucln(b, a%%b))
  }
}
ucln(15,10)
