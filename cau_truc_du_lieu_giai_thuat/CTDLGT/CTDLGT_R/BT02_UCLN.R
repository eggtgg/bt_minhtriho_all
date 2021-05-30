ucln <- function(a, b){
  if(b == 0){
    return(a)
  } else {
    return(ucln(b, a%%b))
  }
}
ucln(15,10)