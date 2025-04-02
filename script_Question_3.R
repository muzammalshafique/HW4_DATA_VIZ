# Ensure ggplot2 and MASS libraries are loaded as well
library(ggplot2)
library(MASS)
library(mgcv)
library(gridExtra)

cars93 <- MASS::Cars93

# Redefine or ensure that the plots are defined
plot_lm <- ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "lm", formula = y ~ x, color = "#8fe388") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)") +
  ggtitle("Smoothing with 'lm' method") +
  theme(plot.title = element_text(size = 14, color = "#8fe388"))

plot_glm <- ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "glm", formula = y ~ x, color = "#fe8d6d") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)") +
  ggtitle("Smoothing with 'glm' method") +
  theme(plot.title = element_text(size = 14, color = "#fe8d6d"))

plot_gam <- ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "gam", formula = y ~ x, color = "#7c6bea") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)") +
  ggtitle("Smoothing with 'gam' method") +
  theme(plot.title = element_text(size = 14, color = "#7c6bea"))

# Use grid.arrange to display the plots in one row
grid.arrange(plot_lm, plot_glm, plot_gam, ncol = 3)