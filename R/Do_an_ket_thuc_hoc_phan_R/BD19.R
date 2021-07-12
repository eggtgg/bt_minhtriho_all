# Bieu do 19: BIEU DO SO CA MAC TRONG NGAY GAN NHAT CUA CAC NUOC DAN DAU
library(data.table)
library(ggplot2)
library(ggrepel)
library(forcats)
library(dplyr)

df_ghi_nhan <- read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv',
                        header = TRUE)
country = df_ghi_nhan$Country.Region
df_ghi_nhan = df_ghi_nhan[,5:ncol(df_ghi_nhan)]
data = data.frame(country,df_ghi_nhan)


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
data_plot_5

data_plot_5$country <- factor(data_plot_5$country, levels = data_plot_5$country)
data_plot_5$country  # notice the changed order of factor levels

ggplot(data = data_plot_5, aes(x=country, y= ghi_nhan))+
  geom_bar(color ='black' ,fill = 'orange',stat="identity")+
  geom_text(aes(label=ghi_nhan), vjust=-0.3, size=3.5)+
  labs(title="BIEU DO SO CA MAC TRONG NGAY GAN NHAT CUA CAC NUOC DAN DAU",
       x ="Country", y = "So ca mac moi")
