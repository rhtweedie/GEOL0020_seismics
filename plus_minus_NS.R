library(ggplot2)
library(tibble)
library(dplyr)


# define variables
tAB <-0.06087
tBA <- 0.07547
V1 <- 310 #calculated from direct wave

# read data
data_to_load <- "data/ns_data.csv"
data <- read.csv(data_to_load)
data <- tibble(data)

# find mean travel time between points A and B
mean_tAB <- mean(c(tAB, tBA))

# plot offset vs travel times
ggplot(data) + 
  geom_point(aes(x = offset, y = tA), size = 2, color = 'red') +
  geom_point(aes(x = offset, y = tB), size = 2, color = 'blue')

# find minus time (tA-tB)
minus_data <- data %>% mutate(
  tA_minus_tB = tA - tB
)

# find plus time (tA + tB - tAB)
plus_minus_data <- minus_data %>% mutate(
  tA_plus_tB_minus_tAB = tA + tB  - mean_tAB
)

# plot offset vs tA-tB (minus)
ggplot(minus_data, aes(x = offset, y = tA_minus_tB)) +
  geom_point() +
  geom_smooth(data = minus_data[1:9,], aes(x = offset, y = tA_minus_tB), method = lm, se = FALSE) +
  geom_smooth(data = minus_data[9:38,], aes(x = offset, y = tA_minus_tB), method = lm, se = FALSE) +
  xlab("Offset (m)") +
  ylab("tA - tB") +
  ggtitle("tA - tB against Offset")

# find and extract gradient of line of best fit
model_1 <- lm(minus_data[1:9,]$tA_minus_tB ~ minus_data[1:9,]$offset)
gradient_1 <- model_1$coefficients[2]
model_2 <- lm(minus_data[9:38,]$tA_minus_tB ~ minus_data[9:38,]$offset)
gradient_2 <- model_2$coefficients[2]

# calculate V2
V2_1 <- 2/gradient_1
V2_2 <- 2/gradient_2

# calculate depths at each geophone
plus_minus_data['depth'] <- NA
for (i in 1:9) {
  plus_minus_data$depth[i] <- (V1*V2_1) / (2 * (V2_1^2 - V1^2)^(1/2)) * plus_minus_data$tA_plus_tB_minus_tAB[i]
}
for (i in 10:38) {
  plus_minus_data$depth[i] <- (V1*V2_2) / (2 * (V2_2^2 - V1^2)^(1/2)) * plus_minus_data$tA_plus_tB_minus_tAB[i]
}

ggplot(plus_minus_data, aes(x = offset, y = depth)) +
  geom_line() +
  ylim(3, -0.1) +
  geom_hline(yintercept = 0) +
  geom_label(label = 'SURFACE', x = 49, y = 0.1) +
  ggtitle('Cross-Section of Depth of First Layer Boundary across Site of Suspected Barrow, NS') +
  xlab('Offset (m)') +
  ylab('Depth (m)') +
  annotate("rect", xmin = 17, xmax = 27, ymin = 0, ymax = 3, alpha = 0.2) +
  annotate("text", label = 'Surface width of barrow', x = 38, y = 2.3, size = 5) +
  annotate("segment", x = 22, xend = 30, y = 2, yend = 2.3)
  
