library(ggplot2)
library(tibble)
library(dplyr)

# define variables
data_to_load = "data/ns_data.csv"
tAB = 0.06087
tBA = 0.07547

# load data
data = read.csv(data_to_load)
data = tibble(data)

# find mean travel time between points A and B
mean_tAB = mean(c(tAB, tBA))

ggplot(data) + 
  geom_point(aes(x = offset, y = tA), size = 2, color = 'red') +
  geom_point(aes(x = offset, y = tB), size = 2, color = 'blue')

# find tA - tB
data = data %>% mutate(
  tA_minus_tB = tA - tB
)

ggplot(data) +
  geom_point(aes(x = offset, y = ))
