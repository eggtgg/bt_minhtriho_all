# Bieu do 1: Tong So ca mac covid 19 ghi nhan tinh den ngay 22/1/2020

df = read.csv('F:\\R\\Do_an_R\\data\\COVID-19-master\\csse_covid_19_data\\csse_covid_19_time_series\\time_series_covid19_confirmed_global.csv', header = TRUE)

names(df)
str(df)

df$khu_vuc = paste(df$Province.State, df$Country.Region)

khu_vuc_mac <- df$khu_vuc[df$X1.22.20>0]
khu_vuc_mac
df

# Create the data for the chart.
v <- df$X1.22.20
v <-  v[v>0]
v
names(v) = khu_vuc_mac
v

plt <- barplot(v,xlab = 'Khu vuc', ylab = 'Ghi nhan', col='steelblue',
               main = 'TONG SO CA MAC COVID 19 GHI NHAN TINH DEN NGAY 22/1/2020',xaxt="n")
text(plt, par("usr")[3], labels = khu_vuc_mac, srt = 45, adj = c(1.1,1.1), xpd = TRUE, cex=0.6)