library(tidyverse)

#-----------------------------------------------------------------------------
# 'Hãy thử và đặt một Nữ hoàng cho một vectơ vị trí của các Hậu hiện tại
# '
# 'Hàm này tự gọi đệ quy cho mọi vị trí hợp lệ của
# 'Hậu tiếp theo.
# '
# '@param queens Một vectơ số nguyên đại diện cho vị trí cột
# 'của các nữ hoàng cho đến nay. Chỉ mục trong danh sách này
# 'là hàng và giá trị là cột.  
# 'Để tạo tất cả các giải pháp, hãy chuyển vào một vectơ trống (mặc định)
# '
# 'ví dụ: Hậu = c (1, 4, 7) tương ứng với các Hậu được đặt tại c (1, 1), c (2, 4) và
# 'c (3, 7)
#'
#'
#'
# '@ Trả về danh sách trong đó mỗi phần tử là một vectơ gồm 8 số nguyên
# 'tức là một giải pháp cho vấn đề 8 hậu
#-----------------------------------------------------------------------------
place_queen <- function(queens=c()) {
  
  #---------------------------------------------------------------------------
  # Nếu có 8 quân hậu được đặt vào, thì đây phải là một giải pháp.
  #---------------------------------------------------------------------------
  if (length(queens) == 8) {
    return(list(queens))
  }
  
  #---------------------------------------------------------------------------
  # Tìm ra nơi quân hậu có thể được đặt ở hàng tiếp theo.
  # Bỏ tất cả các cột đã được sử dụng - Vì ta
  # không thể đặt một nữ hoàng bên dưới một nữ hoàng hiện có
  #---------------------------------------------------------------------------
  possible_placements <- setdiff(1:8, queens)
  
  #---------------------------------------------------------------------------
  # Đối với mỗi quân hậu đã có trên bàn cờ, hãy tìm đường chéo
  # vị trí mà nó có thể nhìn thấy trong hàng này.
  #---------------------------------------------------------------------------
  diag_offsets <- seq.int(length(queens), 1)
  diags <- c(queens + diag_offsets, queens - diag_offsets)
  diags <- diags[diags > 0 & diags < 9]
  
  #---------------------------------------------------------------------------
  # Bỏ các cột chéo này khỏi các vị trí có thể có
  #---------------------------------------------------------------------------
  possible_placements <- setdiff(possible_placements, diags)
  
  #---------------------------------------------------------------------------
  # Đối với mỗi vị trí có thể, hãy thử và đặt một Quân hậu
  #---------------------------------------------------------------------------
  possible_placements %>% 
    map(~place_queen(c(queens, .x))) %>%
    keep(~length(.x) > 0) %>%
    flatten()
}


#-----------------------------------------------------------------------------
# 'Vẽ một giải pháp duy nhất
# '@param Hậu một vectơ gồm 8 số nguyên cho các vị trí cột của 8 nữ hoàng
#-----------------------------------------------------------------------------
plot_single_8queens <- function(queens, title = NULL) {
  queens_df <- tibble(cols = queens, rows=1:8)
  board_df <- expand.grid(cols = 1:8, rows = 1:8) %>% 
    mutate(check = (cols + rows) %%2 == 1)
  
  p <- ggplot(queens_df, aes(rows, cols)) + 
    geom_tile(data=board_df, aes(fill=check), colour='black') +
    geom_text(label='\u2655', family="Arial Unicode MS", size = 8) + 
    theme_void() + 
    coord_equal() + 
    scale_fill_manual(values = c('TRUE'='white', 'FALSE'='grey70')) + 
    theme(
      legend.position = 'none'
    ) 
  
  if (is.null(title)) {
    p <- p + labs(title = paste("Queens:", deparse(as.numeric(queens)))) 
  } else {
    p <- p + labs(title = title)
  }
}


#-----------------------------------------------------------------------------
# Bắt đầu với không đặt nữ hoàng và tạo ra tất cả các giải pháp.
#-----------------------------------------------------------------------------
solutions <- place_queen()

v=1:8
f=function(q){L=length(q)
if(L==8){q}else{flatten(map(setdiff(v,c(q,q+L:1,q-L:1)),~f(c(q,.))))}}
s=data.frame(c=unlist(f(c())),r=v,x=rep(1:92,e=8),z=3)
b=mutate(crossing(c=v,r=v),z=(c+r)%%2)
g=geom_tile
ggplot(s,aes(r,c,fill=z))+g(d=b)+g()+facet_wrap(~x)
