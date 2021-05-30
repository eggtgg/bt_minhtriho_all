install.packages('data.tree')
library(data.tree)

# thiet lap cay
acme <- Node$new("A")
accounting <- acme$AddChild("B")
software <- accounting$AddChild("C")
standards <- accounting$AddChild("D")
research <- acme$AddChild("E")
newProductLine <- research$AddChild("F")
newLabs <- research$AddChild("G")
it <- acme$AddChild("H")
outsource <- it$AddChild("I")
agile <- it$AddChild("J")
goToR <- it$AddChild("K")
print(acme)

# Duyet cay Truoc
acme$Get('level')

# Duyet Cay sau
acme$Get('level', traversal = "post-order")
