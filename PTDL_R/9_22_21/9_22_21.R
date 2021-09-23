
install.packages("ISwR")

install.packages("tidyr")
library(tidyr)


library(ISwR) 
igfdata <- juul2

igfdata

names(igfdata)


options(width=100)

setwd("c:\\MinhTriHo\\R")



attach(igfdata)

mean(age, na.rm = TRUE)

var(age, na.rm = TRUE)
sd(age, na.rm = TRUE)

summary(age, na.rm = TRUE)

desc <- function(x)
{
  av <- mean(x, na.rm = )
  sd <- sd(x, na.rm = TRUE)
  se <- sd/sqrt(length(x))
  c(MEAN=av, SD=sd, SE=se)
}


desc(age)
by(igfdata, sex, summary)

op <- par(mfrow=c(2,3))
hist(igf1)

tapply(igf1, list(sex), mean, na.rm=TRUE)


tapply(igf1, list(tanner, sex), mean, na.rm = TRUE)



# Kiem dinh Thong ke

qt(0.95, 100)
t.test(age, mu=30)
t.test(igf1~ sex)
t.test(igf1~ sex, var.equal=TRUE)
shapiro.test(igf1)
wilcox.test(igf1 ~ sex)


before <- c(180, 140, 160, 160, 220, 185, 145, 160, 160, 170)
after <- c(170, 145, 145, 125, 205, 185, 150, 150, 145, 155)
bp <- data.frame(before, after)
# Kiem dinh t
t.test(before, after, paired=TRUE)
t.test(before, after)

# Kiem Wilcoxon
wilcox.test(before, after, paired=TRUE)


# Tan so(Frequency)
table(sex)
table(tanner)
table(sex, tanner)



freq <- table(sex, tanner)

freq

margin.table(freq, 1)
margin.table(freq, 2)

# tinh phan tram
prop.table(freq, 1)

# tinh phan tram cho toan bo bang
freq/sum(freq)

# Kiem dinh ti le
prop.test(69, 100, 0.50)

binom.test(69, 100, 0.50)

# So sanh 2 ti le
fracture <- c(7, 20)
total <- c(100, 110)
prop.test(fracture, total)

# So sanh nhieu ti le
table(sex, tanner)

female <- c( 4, 43, 22, 0)
total <- c(8, 60, 30, 2)
prop.test(female, total)

# kiem dinh chi binh phuong
chisq.test(sex, tanner)

# kiem dinh Fisher
fisher.test(sex, tanner)

