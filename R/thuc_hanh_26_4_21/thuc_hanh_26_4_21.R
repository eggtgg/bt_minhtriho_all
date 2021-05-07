answer = 0
for (j in 3:5){answer = j+answer}
answer
prod(3:5)
answer_1 = 0
for (i in 1:100){answer_1=answer_1+i}
answer_1
sum(1:100)

answer_2 = 1
for (i in 1:50){answer_2=answer_2*i}
answer_2

prod(1:50)

r = c(3:20)
v= 4*(r**3)*pi/3
answer_3 = data.frame(radius = r,volume = v)
answer_3

a = sapply(answer_3, is.factor)
a
factor()



sapply(tinting, is.factor)
sapply(tinting[, 4:6], levels)
sapply(tinting[, 4:6], is.ordered)
