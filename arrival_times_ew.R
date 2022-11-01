library(ggplot2)
library(tibble)
library(dplyr)

data_to_load <- "data/greenwich_seismics_ew.csv"
data <- read.csv(data_to_load)
data <- tibble(data)

cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

ggplot(data) +
  geom_point(aes(x = offset, y = shot_0), color = cbPalette[1]) +
    geom_smooth(data = data[1:48,], aes(x = offset, y = shot_0), color = cbPalette[1], method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_1), color = cbPalette[2]) +
    geom_smooth(data = data[1:13,], aes(x = offset, y = shot_1), color = cbPalette[2], method = lm, se = FALSE) +
    geom_smooth(data = data[13:48,], aes(x = offset, y = shot_1), color = cbPalette[2], method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_2), color = cbPalette[3]) +
    geom_smooth(data = data[1:12,], aes(x = offset, y = shot_2), color = cbPalette[3], method = lm, se = FALSE) +
    geom_smooth(data = data[12:26,], aes(x = offset, y = shot_2), color = cbPalette[3], method = lm, se = FALSE) +
    geom_smooth(data = data[26:48,], aes(x = offset, y = shot_2), color = cbPalette[3], method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_3), color = cbPalette[4]) +
    geom_smooth(data = data[1:20,], aes(x = offset, y = shot_3), color = cbPalette[4], method = lm, se = FALSE) +
    geom_smooth(data = data[20:24,], aes(x = offset, y = shot_3), color = cbPalette[4], method = lm, se = FALSE) +
    geom_smooth(data = data[24:28,], aes(x = offset, y = shot_3), color = cbPalette[4], method = lm, se = FALSE) +
    geom_smooth(data = data[28:48,], aes(x = offset, y = shot_3), color = cbPalette[4], method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_4), color = cbPalette[5]) +
    geom_smooth(data = data[1:28,], aes(x = offset, y = shot_4), color = cbPalette[5], method = lm, se = FALSE) +
    geom_smooth(data = data[28:36,], aes(x = offset, y = shot_4), color = cbPalette[5], method = lm, se = FALSE) +
    geom_smooth(data = data[36:39,], aes(x = offset, y = shot_4), color = cbPalette[5], method = lm, se = FALSE) +
    geom_smooth(data = data[39:48,], aes(x = offset, y = shot_4), color = cbPalette[5], method = lm, se = FALSE) +
  geom_point(aes(x = offset, y = shot_5), color = cbPalette[6]) +
    geom_smooth(data = data[1:46,], aes(x = offset, y = shot_5), color = cbPalette[6], method = lm, se = FALSE) +
    geom_smooth(data = data[46:48,], aes(x = offset, y = shot_5), color = cbPalette[6], method = lm, se = FALSE) +
  xlab('Offset (m)') +
  ylab('Wave Arrival Time (s)') +
  ggtitle('Arrival Times for each Shot and Geophone Location, EW')

