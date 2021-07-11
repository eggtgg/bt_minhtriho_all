# Bieu do 2: BIEU DO CONG DON SO CA MAC TRONG 10 NGAY GAN NHAT CUA VIET NAM
library('ggplot2')
# Outside bars
df <- read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv',
               header = TRUE)

viet_nam = df[275,5:ncol(df)]
head(viet_nam)

str(viet_nam)
so_ngay = ncol(viet_nam)
so_ca_mac <- c(1:ncol(viet_nam))


for (i in so_ca_mac){
  so_ca_mac[i] <- viet_nam[[i]]
}


so_ca_mac
so_ca_mac_10 = so_ca_mac[(so_ngay-9):so_ngay]
so_ca_mac_10
ngay = names(viet_nam)
ngay_10 = ngay[(so_ngay-9):so_ngay]
ngay_10

data_plot_10 = data.frame(ngay=ngay_10, so_ca_mac= so_ca_mac_10)
data_plot_10
ggplot(data = data_plot_10, aes(x=ngay, y=so_ca_mac))+
  geom_bar(color ='black' ,fill = 'orange',stat="identity")+
  geom_text(aes(label=so_ca_mac), vjust=-0.3, size=3.5)+
  labs(title="BIEU DO CONG DON SO CA MAC TRONG 10 NGAY GAN NHAT CUA VIET NAM",
        x ="Ngay", y = "Tong so ca mac")

