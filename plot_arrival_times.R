library(ggplot2)
library(tibble)
library(dplyr)

data_to_load <- "data/greenwich_seismics_ns.csv"
data <- read.csv(data_to_load)
data <- tibble(data)

ggplot(data) +
  geom_point(aes(x = offset, y = shot_0), color = 'red') +
  geom_point(aes(x = offset, y = shot_1), color = 'blue') +
  geom_point(aes(x = offset, y = shot_2), color = 'green') +
  geom_point(aes(x = offset, y = shot_3), color = 'yellow') +
  geom_point(aes(x = offset, y = shot_4), color = 'orange') +
  geom_point(aes(x = offset, y = shot_5), color = 'purple') +
  geom_point(aes(x = offset, y = shot_6), color = 'pink') +
  xlab('Offset, m') +
  ylab('Wave arrival time, s') +
  ggtitle('Arrival times for each shot and geophone location')

