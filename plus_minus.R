library(ggplot2)
library(tibble)
library(dplyr)


# define variables
data_to_load <- "data/ns_data.csv"
tAB <-0.06087
tBA <- 0.07547
V1 <- 1000 #calculated by hand from direct wave data

# load data
data <- read.csv(data_to_load)
data <- tibble(data)

# find mean travel time between points A and B
mean_tAB <- mean(c(tAB, tBA))

# plot offset vs travel times
ggplot(data) + 
  geom_point(aes(x = offset, y = tA), size = 2, color = 'red') +
  geom_point(aes(x = offset, y = tB), size = 2, color = 'blue')

# find tA-tB
minus_data <- data %>% mutate(
  tA_minus_tB = tA - tB
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
V2 <- 2/gradient_1

# calculate depths at each geophone
plus_minus_data <- minus_data %>% mutate(
  depth = (V1*V2) / (2 * (V2^2 - V1^2)^(1/2)) * mean_tAB
)
