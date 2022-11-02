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


# calculate gradients and find mean and st. dev.
model_1 <- lm(data[1:48,]$shot_0 ~ data[1:48,]$offset)
gradient_1 <- abs(model_1$coefficients[2])
model_2 <- lm(data[13:48,]$shot_1 ~ data[13:48,]$offset)
gradient_2 <- abs(model_2$coefficients[2])
model_3 <- lm(data[26:48,]$shot_2 ~ data[26:48,]$offset)
gradient_3 <- abs(model_3$coefficients[2])
model_4 <- lm(data[1:20,]$shot_3 ~ data[1:20,]$offset)
gradient_4 <- abs(model_4$coefficients[2])
model_5 <- lm(data[28:48,]$shot_3 ~ data[28:48,]$offset)
gradient_5 <- abs(model_5$coefficients[2])
model_6 <- lm(data[1:28,]$shot_4 ~ data[1:28,]$offset)
gradient_6 <- abs(model_6$coefficients[2])
model_7 <- lm(data[39:48,]$shot_4 ~ data[39:48,]$offset)
gradient_7 <- abs(model_7$coefficients[2])
model_8 <- lm(data[1:46,]$shot_5 ~ data[1:46,]$offset)
gradient_8 <- abs(model_8$coefficients[2])

gradients <- c(gradient_1, gradient_2, gradient_3, gradient_4, gradient_5, gradient_6, gradient_7, gradient_8)
mean_grad <- mean(gradients)
std_grad <- sd(gradients)
  
