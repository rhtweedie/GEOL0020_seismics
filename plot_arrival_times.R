library(ggplot2)
library(tibble)
library(dplyr)

data_to_load <- "data/greenwich_seismics_ns.csv"
data <- read.csv(data_to_load)
data <- tibble(data)

ggplot(data) +
  geom_point(aes(x = offset, y = shot_0), color = 'red') +
    stat_smooth(data = data[1:60,], aes(x = offset, y = shot_0), color = 'red', method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_1), color = 'blue') +
    geom_smooth(data = data[1:5,], aes(x = offset, y = shot_1), color = 'blue', method = lm, se = FALSE) +
    geom_smooth(data = data[5:60,], aes(x = offset, y = shot_1), color = 'blue', method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_2), color = 'green') +
    geom_smooth(data = data[1:5,], aes(x = offset, y = shot_2), color = 'green', method = lm, se = FALSE) +
    geom_smooth(data = data[5:13,], aes(x = offset, y = shot_2), color = 'green', method = lm, se = FALSE) +
    geom_smooth(data = data[13:16,], aes(x = offset, y = shot_2), color = 'green', method = lm, se = FALSE) +
    geom_smooth(data = data[16:60,], aes(x = offset, y = shot_2), color = 'green', method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_3), color = 'yellow') +
    geom_smooth(data = data[1:22,], aes(x = offset, y = shot_3), color = 'yellow', method = lm, se = FALSE) +
    geom_smooth(data = data[22:25,], aes(x = offset, y = shot_3), color = 'yellow', method = lm, se = FALSE) +
    geom_smooth(data = data[25:28,], aes(x = offset, y = shot_3), color = 'yellow', method = lm, se = FALSE) +
    geom_smooth(data = data[28:60,], aes(x = offset, y = shot_3), color = 'yellow', method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_4), color = 'orange') +
    geom_smooth(data = data[1:34,], aes(x = offset, y = shot_4), color = 'orange', method = lm, se = FALSE) +
    geom_smooth(data = data[34:37,], aes(x = offset, y = shot_4), color = 'orange', method = lm, se = FALSE) +
    geom_smooth(data = data[37:40,], aes(x = offset, y = shot_4), color = 'orange', method = lm, se = FALSE) +
    geom_smooth(data = data[40:60,], aes(x = offset, y = shot_4), color = 'orange', method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_5), color = 'purple') +
    geom_smooth(data = data[1:46,], aes(x = offset, y = shot_5), color = 'purple', method = lm, se = FALSE) +
    geom_smooth(data = data[46:49,], aes(x = offset, y = shot_5), color = 'purple', method = lm, se = FALSE) +
    geom_smooth(data = data[49:53,], aes(x = offset, y = shot_5), color = 'purple', method = lm, se = FALSE) +
    geom_smooth(data = data[53:60,], aes(x = offset, y = shot_5), color = 'purple', method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_6), color = 'pink') +
    geom_smooth(data = data[1:56,], aes(x = offset, y = shot_6), color = 'pink', method = lm, se = FALSE) +
    geom_smooth(data = data[56:60,], aes(x = offset, y = shot_6), color = 'pink', method = lm, se = FALSE)
  
  xlab('Offset, m') +
  ylab('Wave arrival time, s') +
  ggtitle('Arrival times for each shot and geophone location')

