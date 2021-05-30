#Giai Thua

giai_thua <- function(n){
  if(n == 0){
    return(1)
  } else {
    return(n*giai_thua(n-1))
  }
}
giai_thua(3)
