# sap xep chen

# ý tưởng:
# tạo mãng con đã sắp xếp là phần tử đầu tiên của list cần sắp xếp
# duyệt từng phần tử thứ 2,3,4... khi duyệt xong từng phần tử
# thì chèn phần tử đó vào mảng con đã sắp xếp trên theo đúng thứ tự tăng dần
# lặp lại quá trình.

# Tạo hàm với tham số là một list A cần được săp xêp
insertionsort_function <- function(A){
  for (j in 2:length(A)) {
    key = A[j] 
    # insert A[j] into sorted sequence A[1,...,j-1] 
    i = j - 1 
    # Di chuyển các phần tử có giá trị lớn hơn giá trị 
    # key về sau một vị trí so với vị trí ban đầu
    # của nó
    while (i > 0 && A[i] > key) {
      A[(i + 1)] = A[i]
      i = i - 1 
    }
    A[(i + 1)] = key
  }
  A
} 
insertionsort_function(c(5, 2, 4, 6, 1, 3))
