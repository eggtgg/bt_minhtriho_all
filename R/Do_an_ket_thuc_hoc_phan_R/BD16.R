# Bieu do 15: BIEU DO THE HIEN XU HUONG SO CA PHUC HOI COVID 19 CUA VIET NAM
library('ggplot2')
# Outside bars
df <- read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv',
               header = TRUE)

viet_nam = df[260,5:ncol(df)]
head(viet_nam)

str(viet_nam)
so_ngay = ncol(viet_nam)
so_ca_phuc_hoi <- c(1:ncol(viet_nam))


for (i in so_ca_phuc_hoi){
  so_ca_phuc_hoi[i] <- viet_nam[[i]]
}


so_ca_phuc_hoi
so_ca_phuc_hoi_10 = so_ca_phuc_hoi[(so_ngay-9):so_ngay]
so_ca_phuc_hoi_10
ngay = names(viet_nam)
ngay_10 = ngay[(so_ngay-9):so_ngay]
ngay_10

data_plot = data.frame(ngay=ngay, so_ca_phuc_hoi= so_ca_phuc_hoi)
data_plot

data_plot$ngay <- factor(data_plot$ngay, levels = ngay)
data_plot$ngay  # notice the changed order of factor levels

plot5 <- ggplot(data_plot, aes(ngay, so_ca_phuc_hoi, group = 1)) +
  geom_line(color="red", size=1.2) +
  labs(x = "Ngay", y = "So ca mac", 
       title = "BIEU DO THE HIEN XU HUONG SO CA PHUC HOI COVID 19 CUA VIET NAM")
plot5