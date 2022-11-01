library(ggplot2)
library(tibble)
library(dplyr)

data_to_load <- "data/greenwich_seismics_ns.csv"
data <- read.csv(data_to_load)
data <- tibble(data)

cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

ggplot(data) +
  geom_point(aes(x = offset, y = shot_0), color = cbPalette[1]) +
    stat_smooth(data = data[1:60,], aes(x = offset, y = shot_0), color = cbPalette[1], method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_1), color = cbPalette[2]) +
    geom_smooth(data = data[1:5,], aes(x = offset, y = shot_1), color = cbPalette[2], method = lm, se = FALSE) +
    geom_smooth(data = data[5:60,], aes(x = offset, y = shot_1), color = cbPalette[2], method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_2), color = cbPalette[3]) +
    geom_smooth(data = data[1:5,], aes(x = offset, y = shot_2), color = cbPalette[3], method = lm, se = FALSE) +
    geom_smooth(data = data[5:13,], aes(x = offset, y = shot_2), color = cbPalette[3], method = lm, se = FALSE) +
    geom_smooth(data = data[13:16,], aes(x = offset, y = shot_2), color = cbPalette[3], method = lm, se = FALSE) +
    geom_smooth(data = data[16:60,], aes(x = offset, y = shot_2), color = cbPalette[3], method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_3), color = cbPalette[4]) +
    geom_smooth(data = data[1:22,], aes(x = offset, y = shot_3), color = cbPalette[4], method = lm, se = FALSE) +
    geom_smooth(data = data[22:25,], aes(x = offset, y = shot_3), color = cbPalette[4], method = lm, se = FALSE) +
    geom_smooth(data = data[25:28,], aes(x = offset, y = shot_3), color = cbPalette[4], method = lm, se = FALSE) +
    geom_smooth(data = data[28:60,], aes(x = offset, y = shot_3), color = cbPalette[4], method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_4), color = cbPalette[5]) +
    geom_smooth(data = data[1:34,], aes(x = offset, y = shot_4), color = cbPalette[5], method = lm, se = FALSE) +
    geom_smooth(data = data[34:37,], aes(x = offset, y = shot_4), color = cbPalette[5], method = lm, se = FALSE) +
    geom_smooth(data = data[37:40,], aes(x = offset, y = shot_4), color = cbPalette[5], method = lm, se = FALSE) +
    geom_smooth(data = data[40:60,], aes(x = offset, y = shot_4), color = cbPalette[5], method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_5), color = cbPalette[6]) +
    geom_smooth(data = data[1:46,], aes(x = offset, y = shot_5), color = cbPalette[6], method = lm, se = FALSE) +
    geom_smooth(data = data[46:49,], aes(x = offset, y = shot_5), color = cbPalette[6], method = lm, se = FALSE) +
    geom_smooth(data = data[49:53,], aes(x = offset, y = shot_5), color = cbPalette[6], method = lm, se = FALSE) +
    geom_smooth(data = data[53:60,], aes(x = offset, y = shot_5), color = cbPalette[6], method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_6), color = cbPalette[7]) +
    geom_smooth(data = data[1:56,], aes(x = offset, y = shot_6), color = cbPalette[7], method = lm, se = FALSE) +
    geom_smooth(data = data[56:60,], aes(x = offset, y = shot_6), color = cbPalette[7], method = lm, se = FALSE) +
  xlab('Offset (m)') +
  ylab('Wave Arrival Time (s)') +
  ggtitle('Arrival Times for each Shot and Geophone Location, NS')

