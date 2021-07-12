# Bieu do 6&7&8 : BIEU DO THE HIEN SU TUONG QUAN GIUA SO CA MAC COVID 19
# VOI SO CA TU VONG, SO CA MAC COVID 19 VOI SO CA PHUC HOI
# SO CA PHUC HOI VA SO CA TU VONG
# CUA VIET NAM TRONG 30 NGAY GAN NHAT

# Bieu do 9&10&11: BIEU THE HIEN SU PHAN BO CUA SO CA MAC, TU VONG VA PHUC HOI
# TAI VIET NAM TRONG 30 NGAY GAN NHAT

library('ggplot2')
library(tibble)
library(tidyr)
library(dplyr)
library(readr)
df_ghi_nhan <- read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv',
                        header = TRUE)
df_tu_vong <- read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv',
                       header = TRUE)
df_phuc_hoi <- read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv',
                        header = TRUE)

# xu ly du lieu so ca ghi nhan
viet_nam_ghi_nhan = df_ghi_nhan[275,5:ncol(df_ghi_nhan)]
head(viet_nam_ghi_nhan)
str(viet_nam_ghi_nhan)

so_ngay = ncol(viet_nam_ghi_nhan)
so_ca_mac <- c(2:ncol(viet_nam_ghi_nhan))

for (i in so_ca_mac){
  so_ca_mac[i] <- viet_nam_ghi_nhan[[i]]- viet_nam_ghi_nhan[[i-1]]
}

so_ca_mac
so_ca_mac_10 = so_ca_mac[(so_ngay-29):so_ngay]
so_ca_mac_10
ngay = names(viet_nam_ghi_nhan)
ngay_10 = ngay[(so_ngay-29):so_ngay]
ngay_10

data_plot_10 = data.frame(ngay=ngay_10, so_ca_mac= so_ca_mac_10)
data_plot_10

# Xu ly du lieu so ca tu vong
viet_nam_tu_vong = df_tu_vong[275,5:ncol(df_tu_vong)]
viet_nam_tu_vong

so_ca_tu_vong <- c(2:ncol(viet_nam_tu_vong))

for (i in so_ca_tu_vong){
  so_ca_tu_vong[i] <- viet_nam_tu_vong[[i]]- viet_nam_tu_vong[[i-1]]
}

so_ca_tu_vong_10 = so_ca_tu_vong[(so_ngay-29):so_ngay]
so_ca_tu_vong_10

data_plot_10_tu_vong = data.frame(ngay=ngay_10, so_ca_tu_vong= so_ca_tu_vong_10)
data_plot_10_tu_vong

# Xy ly du lieu so ca phuc hoi
viet_nam_phuc_hoi = df_phuc_hoi[260,5:ncol(df_phuc_hoi)]
viet_nam_phuc_hoi

so_ca_phuc_hoi <- c(2:ncol(viet_nam_phuc_hoi))

for (i in so_ca_phuc_hoi){
  so_ca_phuc_hoi[i] <- viet_nam_phuc_hoi[[i]]- viet_nam_phuc_hoi[[i-1]]
}

so_ca_phuc_hoi_10 = so_ca_phuc_hoi[(so_ngay-29):so_ngay]
so_ca_phuc_hoi_10

data_plot_10 = data.frame(ngay=ngay_10, so_ca_mac = so_ca_mac_10,
                          so_ca_tu_vong = so_ca_tu_vong_10,
                          so_ca_phuc_hoi = so_ca_phuc_hoi_10)
data_plot_10
data_plot <- data.frame(ngay=ngay, so_ca_mac = so_ca_mac,
                        so_ca_tu_vong = so_ca_tu_vong,
                        so_ca_phuc_hoi = so_ca_phuc_hoi)

data_plot


# Bieu do 6: BIEU THE HIEN SU TUONG QUAN SO CA MAC SO CA TU VONG
library(ggplot2)
sp <- ggplot(data_plot_10, aes(x=so_ca_mac, y=so_ca_tu_vong/so_ca_mac)) + geom_point(shape=1)
sp+
  labs(title="BIEU THE HIEN SU TUONG QUAN SO CA MAC, SO CA TU VONG")

# Bieu do 7: BIEU THE HIEN SU TUONG QUAN SO CA MAC SO CA PHUC HOI
sp_2 <- ggplot(data_plot_10, aes(x=so_ca_mac, y=so_ca_phuc_hoi/so_ca_mac)) + geom_point(shape=1)
sp_2+
  labs(title="BIEU THE HIEN SU TUONG QUAN SO CA MAC, SO CA PHUC HOI")

# Bieu do 8: BIEU THE HIEN SU TUONG QUAN SO CA TU VONG, SO CA PHUC HOI
sp_3 <- ggplot(data_plot_10, aes(x=so_ca_tu_vong, y=so_ca_phuc_hoi/so_ca_tu_vong)) + geom_point(shape=1)
sp_3+
  labs(title="BIEU THE HIEN SU TUONG QUAN SO CA TU VONG, SO CA PHUC HOI")

# Bieu do 9: BIEU THE HIEN SU PHAN BO CUA SO CA MAC TAI VIET NAM
hp <- ggplot(data_plot, aes(x=so_ca_mac)) + geom_histogram(binwidth=2)
hp+
  labs(title="BIEU THE HIEN SU PHAN BO CUA SO CA MAC TAI VIET NAM")

# Bieu do 10: BIEU THE HIEN SU PHAN BO CUA SO CA TU VONG TAI VIET NAM
hp_2 <- ggplot(data_plot, aes(x=so_ca_tu_vong)) + geom_histogram(binwidth=2)
hp_2+
  labs(title="BIEU THE HIEN SU PHAN BO CUA SO CA TU VONG TAI VIET NAM")

# Bieu do 11: BIEU THE HIEN SU PHAN BO CUA SO CA PHUC HOI TAI VIET NAM
hp_2 <- ggplot(data_plot, aes(x=so_ca_phuc_hoi)) + geom_histogram(binwidth=2)
hp_2+
  labs(title="BIEU THE HIEN SU PHAN BO CUA SO CA PHUC HOI TAI VIET NAM")
