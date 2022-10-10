library(ggplot2)
library(tibble)
library(dplyr)

# load data
ns_data = read.csv("data/ns_data.csv")
ns_data = tibble(ns_data)
ew_data = read.csv("data/ew_data.csv")
ew_data = tibble(ew_data)

ggplot(ns_data) + 
  geom_point(aes(x = Offset, y = TA), size = 2, color = 'red') +
  geom_point(aes(x = Offset, y = TB), size = 2, color = 'blue')

ns_data %>% mutate(
  ta_minus_tb = TA - TB
)

ggplot(ns_data) +
  geom_point(aes(x = Offset, y = ta_minus_tb))

