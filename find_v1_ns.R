library(ggplot2)
library(tibble)
library(dplyr)


# read data
data_to_load <- "data/greenwich_seismics_ns.csv"
data <- read.csv(data_to_load)
data <- tibble(data)


# find gradients of direct waves

model_dir_1 <- lm(data[1:5,]$shot_1 ~ data[1:5,]$offset)
gradient_1 <- abs(model_dir_1$coefficients[2])

model_dir_21 <- lm(data[5:13,]$shot_2 ~ data[5:13,]$offset)
gradient_21 <- abs(model_dir_21$coefficients[2])
model_dir_22 <- lm(data[13:16,]$shot_2 ~ data[13:16,]$offset)
gradient_22 <- abs(model_dir_22$coefficients[2])

model_dir_31 <- lm(data[22:25,]$shot_3 ~ data[22:25,]$offset)
gradient_31 <- abs(model_dir_31$coefficients[2])
model_dir_32 <- lm(data[25:28,]$shot_3 ~ data[25:28,]$offset)
gradient_32 <- abs(model_dir_32$coefficients[2])

model_dir_41 <- lm(data[34:37,]$shot_4 ~ data[34:37,]$offset)
gradient_41 <- abs(model_dir_41$coefficients[2])
model_dir_42 <- lm(data[37:40,]$shot_4 ~ data[37:40,]$offset)
gradient_42 <- abs(model_dir_42$coefficients[2])

model_dir_51 <- lm(data[46:49,]$shot_5 ~ data[46:49,]$offset)
gradient_51 <- abs(model_dir_51$coefficients[2])
model_dir_52 <- lm(data[49:53,]$shot_5 ~ data[49:53,]$offset)
gradient_52 <- abs(model_dir_52$coefficients[2])

model_dir_6 <- lm(data[56:60,]$shot_6 ~ data[56:60,]$offset)
gradient_6 <- abs(model_dir_6$coefficients[2])

gradients = c(gradient_1, gradient_21, gradient_22, gradient_31, gradient_32, gradient_41, gradient_42, gradient_51, gradient_52, gradient_6)
mean_grad = mean(gradients)
v1 = 1/mean_grad
