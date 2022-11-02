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

# calculate gradients and find mean and st. dev.
model_0 <- lm(data[1:60,]$shot_0 ~ data[1:60,]$offset)
gradient_0 <- abs(model_0$coefficients[2])
model_1 <- lm(data[5:60,]$shot_1 ~ data[5:60,]$offset)
gradient_1 <- abs(model_1$coefficients[2])
model_21 <- lm(data[1:5,]$shot_2 ~ data[1:5,]$offset)
gradient_21 <- abs(model_21$coefficients[2])
model_22 <- lm(data[16:60,]$shot_2 ~ data[16:60,]$offset)
gradient_22 <- abs(model_22$coefficients[2])
model_31 <- lm(data[1:22,]$shot_3 ~ data[1:22,]$offset)
gradient_31 <- abs(model_31$coefficients[2])
model_32 <- lm(data[28:60,]$shot_3 ~ data[28:60,]$offset)
gradient_32 <- abs(model_32$coefficients[2])
model_41 <- lm(data[1:34,]$shot_4 ~ data[1:34,]$offset)
gradient_41 <- abs(model_41$coefficients[2])
model_42 <- lm(data[40:60,]$shot_4 ~ data[40:60,]$offset)
gradient_42 <- abs(model_42$coefficients[2])
model_51 <- lm(data[1:46,]$shot_5 ~ data[1:46,]$offset)
gradient_51 <- abs(model_51$coefficients[2])
model_52 <- lm(data[53:60,]$shot_5 ~ data[53:60,]$offset)
gradient_52 <- abs(model_52$coefficients[2])
model_6 <- lm(data[1:56,]$shot_6 ~ data[1:56,]$offset)
gradient_6 <- abs(model_6$coefficients[2])

gradients <- c(gradient_0, gradient_1, gradient_21, gradient_22, gradient_31, gradient_32, gradient_41, gradient_42, gradient_51, gradient_52, gradient_6)
mean_grad <- mean(gradients)
std_grad <- sd(gradients)
