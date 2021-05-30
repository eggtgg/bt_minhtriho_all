# danh sach lien ket
lst <- list() # creates an empty (length zero) list
lst[[1]] <- 1 # automagically extends the lst
lst[[2]] <- 2 # ditto
lst
lst <- list(1, 2, 3, 4, 5)    # a list of 5 items
lst <- vector("list", 10000)  # 10000 NULLs
lst[[1]] <- 1
lst[[10000]] <- 10000  # lst now contains 1, NULL, ..., NULL, 10000
lst
