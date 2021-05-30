thap_ha_noi <- function(n, toa1, toa2, toa3){
  if (n==1){
    print(toa1)
    print('|')
    print(toa3)
    print('')
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
