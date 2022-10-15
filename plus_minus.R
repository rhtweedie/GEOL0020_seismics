library(ggplot2)
library(tibble)
library(dplyr)


# define variables
data_to_load = "data/ns_data.csv"
tAB = 0.06087
tBA = 0.07547
V1 = 1000 #calculated by hand from direct wave data

# load data
data = read.csv(data_to_load)
data = tibble(data)

# find mean travel time between points A and B
mean_tAB = mean(c(tAB, tBA))

# plot offset vs travel times
ggplot(data) + 
  geom_point(aes(x = offset, y = tA), size = 2, color = 'red') +
  geom_point(aes(x = offset, y = tB), size = 2, color = 'blue')

# find tA-tB
minus_data = data %>% mutate(
  tA_minus_tB = tA - tB
)

# plot offset vs tA-tB (minus)
ggplot(minus_data, aes(x = offset, y = tA_minus_tB)) +
  geom_point() +
  geom_smooth(aes(x = offset, y = tA_minus_tB), method = lm, se = FALSE) +
  xlab("Offset (m)") +
  ylab("tA - tB") +
  ggtitle("tA - tB against Offset")

# find and extract gradient of line of best fit
model = lm(minus_data$tA_minus_tB ~ minus_data$offset)
gradient = model$coefficients[2]

# calculate V2
V2 = 2/gradient
