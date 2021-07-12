# Bieu do 18: BIEU DO THE HIEN TI LE TONG SO CA PHUC HOI COVID 19 CUA CAC QUOC GIA DAN DAU TREN THE GIOI
library(data.table)
library(ggplot2)
library(ggrepel)
library(forcats)
library(dplyr)

df_phuc_hoi <- read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv',
                       header = TRUE)
country = df_phuc_hoi$Country.Region
df_phuc_hoi = df_phuc_hoi[,5:ncol(df_phuc_hoi)]
data = data.frame(country,df_phuc_hoi)


data <- data.table(data)  # DF is your original data
data = data[, lapply(.SD, sum), by=country]
data
name = names(data)

n = length(name)
data = data.frame(data)
data[,n]

data_sort <-data[order(data[,n],decreasing = TRUE),]

data_plot = data.frame(country = data_sort[,1],ghi_nhan = data_sort[,ncol(data_sort)])
data_plot_5 = data_plot[1:5,]

sum(data_plot_5$ghi_nhan)
data_plot_5$phan_tram = (format(round((data_plot_5$ghi_nhan / sum(data_plot_5$ghi_nhan)), 2), nsmall = 2))
data_plot_5$phan_tram <- as.numeric(data_plot_5$phan_tram)*100

data_plot_5_2 <- data_plot_5 %>% 
  mutate(csum = rev(cumsum(rev(phan_tram))), 
         pos = phan_tram/2 + lead(csum, 1),
         pos = if_else(is.na(pos), phan_tram/2, pos))
data_plot_5_2

ggplot(data_plot_5, aes(x = "" , y = phan_tram, fill = fct_inorder(country))) +
  geom_col(width = 1, color = 1) +
  coord_polar(theta = "y") +
  scale_fill_brewer(palette = "Pastel1") +
  geom_label_repel(data = data_plot_5_2,
                   aes(y = pos, label = paste0(phan_tram, "%")),
                   size = 4.5, nudge_x = 1, show.legend = FALSE) +
  guides(fill = guide_legend(title = "Country")) +
  labs(title="BIEU DO THE HIEN TI LE TONG SO CA PHUC HOI COVID 19 CUA CAC QUOC GIA DAN DAU TREN THE GIOI",
  )+
  theme_void()
