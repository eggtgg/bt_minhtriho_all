#### heap sort
#### min-heap
#### bottom-top algorithm used

# 1. Xây dựng một heap tối đa từ dữ liệu đầu vào.

# 2. Tại thời điểm này, mục lớn nhất được lưu trữ ở gốc của heap. 
# Thay thế nó bằng mục cuối cùng của heap, sau đó giảm kích thước của heap đi 1.
# Cuối cùng, ta có một gốc heap.

# 3. Lặp lại bước 2 trong khi kích thước của heap lớn hơn 1.


# Tạo heap từ vector dua vao
heap.building<-function(vec)
{
  len=length(vec)
  heap=vec
  for (j in len:1)
  {
    heap=modify.heap(heap,j)
  }
  return(heap)
}


# kiem tra heap co phai là một heap hay không
is.heap<-function(heap,root_i)
{
  i=root_i
  res=T
  while(2*i<=length(heap)&res)
  {
    son=c(heap[2*i],heap[2*i+1])
    son=son[!is.na(son)]
    res=all(heap[i]<=son)
    i=i+1
  }
  return(res)
}

# sửa đổi heap
modify.heap<-function(heap,root_i)
{
  len=length(heap)
  flag=1
  
  while (root_i*2<=len&&flag==1)
  {
    left_i=root_i*2
    right_i=root_i*2+1
    flag=0
    son=c(heap[left_i],heap[right_i])
    son=son[!is.na(son)]
    min_ind=which.min(son)
    if (heap[root_i]>son[min_ind])
    {
      flag=1
      heap_ind=c(left_i,right_i)[min_ind]
      
      tmp=heap[heap_ind]
      heap[heap_ind]=heap[root_i]
      heap[root_i]=tmp
      
      root_i=heap_ind
    }
  }
  return(heap)
}

# sắp xếp heap
heap.sort<-function(heap)
{
  sorted=NULL
  len=length(heap)
  while(len>0)
  {
    sorted=c(sorted,heap[1])
    len=length(heap)
    heap[1]=heap[len]
    heap=heap[1:(len-1)]
    heap=modify.heap(heap,root_i=1)
    len=len-1
  }
  return(sorted)
}

#vec=sample(1:100)
vec = c(-1,2,1,10,3,9)
heap=heap.building(vec)
heap_sort=heap.sort(heap)
heap_sort
