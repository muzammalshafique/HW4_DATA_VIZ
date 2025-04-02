# Load libraries
library(dplyr)
library(ggplot2)
library(lubridate)

load("preprint_growth.rda")
# a
preprint_full <- preprint_growth %>%
  drop_na() %>%
  filter(count > 0, year(date) > 2004)
# b
selected_preprints <- preprint_full %>%
  filter(archive %in% c("bioRxiv", "F1000Research"))
# c
plot <- ggplot(selected_preprints) +
  aes(x = date, y = count, color = archive, fill = archive) +
  geom_line(size = 1) +
  scale_color_manual(values = c("bioRxiv" = "#7c6bea", "F1000Research" = "#fe8d6d")) +
  labs(title = "Preprint Counts", y = "Count", x = "Date")  # Adding the title here

# d
plot <- plot + theme(legend.position = "right")

# e
plot <- plot + scale_x_date(limits = c(ymd("2014-02-01"), NA))

# f
plot <- ggplot(selected_preprints) +
  aes(x = date, y = count, color = archive, fill = archive) +
  geom_line(size = 1) +
  scale_color_manual(values = c("bioRxiv" = "#7c6bea", "F1000Research" = "#fe8d6d")) +
  labs(title = "Preprint Counts", y = "Count", x = "Date") +
  theme(legend.position = "right") +
  scale_x_date(limits = c(ymd("2014-02-01"), NA))

print(plot)