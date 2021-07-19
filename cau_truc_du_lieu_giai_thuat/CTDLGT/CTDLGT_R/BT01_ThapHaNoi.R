# Tạo hàm nhập vào 4 giá trị:
#...n: số tầng của tháp
#...cac toa thap
thap_ha_noi <- function(n, toa1, toa2, toa3){
  # Nếu n chỉ còn 1 thì chuyển tầng này vào tòa số 3
  if (n==1){
    print(toa1)
    print('|')
    print(toa3)
    print('')
    # Ngược lại, tiếp tục gọi hàm thap_ha_noi
    # cho đến khi giải được bài toán (n=1)
  } else {
      thap_ha_noi(n-1,toa1, toa3, toa2)
      print(toa1)
      print('|')
      print(toa3)
      print('')
      thap_ha_noi(n-1,toa2, toa1, toa3)
  }
}
thap_ha_noi(3,'A','B','C')
