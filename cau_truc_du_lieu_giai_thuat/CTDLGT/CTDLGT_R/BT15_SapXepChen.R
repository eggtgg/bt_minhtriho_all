# sap xep chen
insertionsort_function <- function(A){
  for (j in 2:length(A)) {
    key = A[j] 
    # insert A[j] into sorted sequence A[1,...,j-1] 
    i = j - 1 
    while (i > 0 && A[i] > key) {
      A[(i + 1)] = A[i]
      i = i - 1 
    }
    A[(i + 1)] = key
  }
  A
} 
insertionsort_function(c(5, 2, 4, 6, 1, 3))
