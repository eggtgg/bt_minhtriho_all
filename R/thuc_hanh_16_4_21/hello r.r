setwd("T:\\R\\thuc_hanh_16_4_21")

A = read.csv("Temperature.csv", header = TRUE)
trung_binh = tapply(A$Temperature, A$Month, mean, na.rm =TRUE)
trung_binh
trung_binh2 = tapply(A$Temperature, list(A$Year, A$Month), mean, na.rm =TRUE)
trung_binh2
trung_binh3 = tapply(A$Temperature, A$Month, sd, na.rm =TRUE)
trung_binh3
help(table)

table(A$Year)
table(A$Station,A$Year)
