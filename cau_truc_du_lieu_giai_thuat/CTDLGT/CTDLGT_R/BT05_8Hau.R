library(tidyverse)

#-----------------------------------------------------------------------------
#' Try and place a Queen given a vector of positions of the current Queens
#'
#' This function calls itself recursively for every valid placement of the
#' next queen. 
#'
#' @param queens A vector of integers representing the column placement 
#'               of queens so far. The index within this list
#'               is the row, and the value is the column.  
#'               To generate all solutions, pass in an empty vector (the default)
#'
#'  e.g. queens = c(1, 4, 7) corresponds to queens placed at c(1, 1), c(2, 4) and
#'  c(3, 7)
#'                  
#'
#'  ---------------------------------
#'  |   |   |   |   |   |   |   |   |
#'  ---------------------------------
#'  |   |   |   |   |   |   |   |   |
#'  ---------------------------------
#'  |   |   |   |   |   |   |   |   |
#'  ---------------------------------
#'  |   |   |   |   |   |   |   |   |
#'  ---------------------------------
#'  |   |   |   |   |   |   | Q |   |    3rd row, 7th column
#'  --------------------------------- 
#'  |   |   |   | Q |   |   |   |   |    2nd row, 4th column
#'  ---------------------------------
#'  | Q |   |   |   |   |   |   |   |    1st row, 1st column
#'  ---------------------------------
#'
#'
#'
#'
#' @return a list where each element is a vector of 8 integers 
#'         i.e. a solution to the 8 queens problem
#-----------------------------------------------------------------------------
place_queen <- function(queens=c()) {
  
  #---------------------------------------------------------------------------
  # If there are 8 queens placed, then this must be a solution.
  #---------------------------------------------------------------------------
  if (length(queens) == 8) {
    return(list(queens))
  }
  
  #---------------------------------------------------------------------------
  # Figure out where a queen can be placed in the next row.
  # Drop all columns that have already been taken - since we 
  # can't place a queen below an existing queen
  #---------------------------------------------------------------------------
  possible_placements <- setdiff(1:8, queens)
  
  #---------------------------------------------------------------------------
  # For each queen already on the board, find the diagonal 
  # positions that it can see in this row.
  #---------------------------------------------------------------------------
  diag_offsets <- seq.int(length(queens), 1)
  diags <- c(queens + diag_offsets, queens - diag_offsets)
  diags <- diags[diags > 0 & diags < 9]
  
  #---------------------------------------------------------------------------
  # Drop these diagonal columns from possible placements
  #---------------------------------------------------------------------------
  possible_placements <- setdiff(possible_placements, diags)
  
  #---------------------------------------------------------------------------
  # For each possible placement, try and place a queen
  #---------------------------------------------------------------------------
  possible_placements %>% 
    map(~place_queen(c(queens, .x))) %>%
    keep(~length(.x) > 0) %>%
    flatten()
}


#-----------------------------------------------------------------------------
#' Plot a single solution
#' @param queens a vector of 8 integers giving the column positions of 8 queens
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
# Start with no queens placed and generate all solutions.
#-----------------------------------------------------------------------------
solutions <- place_queen()

v=1:8
f=function(q){L=length(q)
if(L==8){q}else{flatten(map(setdiff(v,c(q,q+L:1,q-L:1)),~f(c(q,.))))}}
s=data.frame(c=unlist(f(c())),r=v,x=rep(1:92,e=8),z=3)
b=mutate(crossing(c=v,r=v),z=(c+r)%%2)
g=geom_tile
ggplot(s,aes(r,c,fill=z))+g(d=b)+g()+facet_wrap(~x)
