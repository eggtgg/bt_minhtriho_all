# Bieu do 13: BIEU DO CONG DON SO CA PHUC HOI TRONG 10 NGAY GAN NHAT CUA VIET NAM
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

data_plot_10 = data.frame(ngay=ngay_10, so_ca_phuc_hoi= so_ca_phuc_hoi_10)
data_plot_10

data_plot_10$ngay <- factor(data_plot_10$ngay, levels = data_plot_10$ngay[order(data_plot_10$so_ca_phuc_hoi)])
data_plot_10$ngay  # notice the changed order of factor levels

ggplot(data = data_plot_10, aes(x=ngay, y=so_ca_phuc_hoi))+
  geom_bar(color ='black' ,fill = 'blue',stat="identity")+
  geom_text(aes(label=so_ca_phuc_hoi), vjust=-0.3, size=3.5)+
  labs(title="BIEU DO CONG DON SO CA PHUC HOI TRONG 10 NGAY GAN NHAT CUA VIET NAM",
       x ="Ngay", y = "Tong so CA PHUC HOI")
