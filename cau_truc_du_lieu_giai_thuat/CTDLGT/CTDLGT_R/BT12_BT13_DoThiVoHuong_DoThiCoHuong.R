# DO THI

install.packages('igraph')
library(igraph)

# Vo Huong
help(graph)

# A nối B nối C nối D nối A
# E nối với A,B,C,D
vo_huong <- make_graph( ~ A-B-C-D-A, E-A:B:C:D)
plot(vo_huong)


#Co huong
help(make_directed_graph)
# nối theo từng cặp một  (1,2), (2,3)....
a = make_graph(c(1, 2, 2, 3, 3, 4, 5, 6, 4,1, 2,4, 4,5, 6,1), directed = TRUE)
plot(a)
