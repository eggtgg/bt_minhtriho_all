#7. Su dung R cho tinh xac suat
#7.1 Phep hoan vi(permutation)
#Tính giai th???a
#Tìm 3!
prod(3:1)
#Tim 10!
prod(10:1)
#Tim 10.9.8.7.6.5.4
prod(10:4)
#7.2 To hop (combination)
#Tim C(5,2)
choose(5, 2)
#Tim xac suat cap A va B trong so 5 nguoi duoc dac cu vao hai chuc vu
1/choose(5, 2)
#7.3 Bien so ngau nhien va ham phan phoi
#7.3.1 Ham phan phoi nhi phan
dbinom(2, 3, 0.60)
1 - pbinom(7, 10, 0.7)
#mo phong nhi phan
b = rbinom(1000, 20, 0.2)
table(b)
hist(b, main = 'Number of hypertensive patients')
#7.3.2 Ham phan phoi Poisson
dpois(2, 1)
dpois(1, 1)
dpois(0, 1)
ppois(2, 1)
1 - ppois(2, 1)
#7.3.3 Ham phan phoi chuan
height = seq(130, 200, 1)
plot(height, dnorm(height, 156, 4.6),
     ylab='f(height)',
     xlab='Height',
     main = 'Probability distribution of height in VN women')
dnorm(160, mean = 156, sd=4.6)
pnorm(150, 156, 4.6)
1-pnorm(164, 156, 4.6)
1-pnorm(120, mean=100, sd=13)
#7.3.4 Ham phan phoi chuan hoa
height = seq(-4,4,0.1)
height
plot(height)
pnorm(-1.96, mean=0, sd=1)
pnorm(1.96, mean=0, sd=1)
pnorm(1.96) - pnorm(-1.96)
1-pnorm(3.04)
qnorm(0.95, mean=0, sd=1)
qnorm(0.975, mean=0, sd=1)