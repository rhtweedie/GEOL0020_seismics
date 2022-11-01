library(ggplot2)
library(tibble)
library(dplyr)


# read data
data_to_load <- "data/greenwich_seismics_ns.csv"
data <- read.csv(data_to_load)
data <- tibble(data)


# find gradients of direct waves

model_dir_1 <- lm(data[1:12,]$shot_1 ~ data[1:12,]$offset)
gradient_1 <- abs(model_dir_1$coefficients[2])

model_dir_21 <- lm(data[1:12,]$shot_2 ~ data[1:12,]$offset)
gradient_21 <- abs(model_dir_21$coefficients[2])
model_dir_22 <- lm(data[13:24,]$shot_2 ~ data[13:24,]$offset)
gradient_22 <- abs(model_dir_22$coefficients[2])

model_dir_31 <- lm(data[20:24,]$shot_3 ~ data[20:24,]$offset)
gradient_31 <- abs(model_dir_31$coefficients[2])
model_dir_32 <- lm(data[24:27,]$shot_3 ~ data[24:27,]$offset)
gradient_32 <- abs(model_dir_32$coefficients[2])

model_dir_41 <- lm(data[27:36,]$shot_4 ~ data[27:36,]$offset)
gradient_41 <- abs(model_dir_41$coefficients[2])
model_dir_42 <- lm(data[36:39,]$shot_4 ~ data[36:39,]$offset)
gradient_42 <- abs(model_dir_42$coefficients[2])

model_dir_5 <- lm(data[46:48,]$shot_5 ~ data[46:48,]$offset)
gradient_5 <- abs(model_dir_5$coefficients[2])

gradients = c(gradient_1, gradient_21, gradient_22, gradient_31, gradient_32, gradient_41, gradient_42, gradient_5)
mean_grad = mean(gradients)
v1 = 1/mean_grad
plot(gradients, ylim = c(0, 0.004))
