# Bieu do 12: BIEU DO CONG DON SO CA TU VONG TRONG 10 NGAY GAN NHAT CUA VIET NAM
library('ggplot2')
# Outside bars
df <- read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv',
               header = TRUE)

viet_nam = df[275,5:ncol(df)]
head(viet_nam)

str(viet_nam)
so_ngay = ncol(viet_nam)
so_ca_tu_vong <- c(1:ncol(viet_nam))


for (i in so_ca_tu_vong){
  so_ca_tu_vong[i] <- viet_nam[[i]]
}


so_ca_tu_vong
so_ca_tu_vong_10 = so_ca_tu_vong[(so_ngay-9):so_ngay]
so_ca_tu_vong_10
ngay = names(viet_nam)
ngay_10 = ngay[(so_ngay-9):so_ngay]
ngay_10

data_plot_10 = data.frame(ngay=ngay_10, so_ca_tu_vong= so_ca_tu_vong_10)
data_plot_10

data_plot_10$ngay <- factor(data_plot_10$ngay, levels = data_plot_10$ngay[order(data_plot_10$so_ca_tu_vong)])
data_plot_10$ngay  # notice the changed order of factor levels

ggplot(data = data_plot_10, aes(x=ngay, y=so_ca_tu_vong))+
  geom_bar(color ='black' ,fill = 'red',stat="identity")+
  geom_text(aes(label=so_ca_tu_vong), vjust=-0.3, size=3.5)+
  labs(title="BIEU DO CONG DON SO CA TU VONG TRONG 10 NGAY GAN NHAT CUA VIET NAM",
       x ="Ngay", y = "Tong so ca tu vong")
