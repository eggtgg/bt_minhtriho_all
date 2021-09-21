#cai dat neu chua cai install.packages("nycflights13")
library(nycflights13)
library(ggplot2)
library(dplyr)
#Cau 1
alaska_flights <- flights %>%
  filter(carrier == "AS")
ggplot(data = alaska_flights,
       mapping = aes(x = dep_delay, y = arr_delay)) +
  geom_point()

#Cau 2
early_january_weather <- weather %>%
  filter(origin == "EWR" & month == 1 & day <= 15)
ggplot(data = early_january_weather,
       mapping = aes(x = time_hour, y = temp)) +
  geom_line()

#Cau 3
ggplot(data = weather, mapping = aes(x = temp)) +
  geom_histogram()

#Cau 4
ggplot(data = weather, mapping = aes(x = factor(month), y = temp)) +
  geom_boxplot()

#Cau 5
ggplot(data = flights, mapping = aes(x = carrier)) +
  geom_bar()
