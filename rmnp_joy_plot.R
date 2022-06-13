# RMNP Joy Plot
# LAG 
# 2022-06-10
# Modeled after https://www.helenmakesmaps.com/post/how-to-joy-plot

library(tidyverse)
library(ggridges)
library(showtext)

font_add_google("Kanit")
showtext_opts(dpi = 300)
showtext_auto(enable = TRUE)

# Load data from QGIS processing
transects <- readr::read_csv("/Users/leighannganzar/Desktop/Post-Doc/RMNP/RMNP-elevation/data/coords.csv")

# Rename columns
transects <- transects %>%
  rename(elevation = rmnp_eleva,
         lon = x,
         lat = y)

transects %>%
  summarize(mean = mean(elevation))

# Plot
(rmnp_joy <- ggplot(transects,
                   aes(x = lon, y = lat, group = lat, height = elevation)) +
  geom_density_ridges(stat = "identity",
                      scale = 40,
                      fill = "black",
                      alpha = 0.4,
                      color = "white") +
  theme(text=element_text(family="Kanit"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "black"),
        axis.line = element_blank(),
        axis.text.x = element_blank(),
        plot.background = element_rect(fill = "black"),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.x=element_text(colour="white")) +
  labs(x = "Rocky Mountain National Park"))
ggsave("/Users/leighannganzar/Desktop/Post-Doc/RMNP/RMNP-elevation/black_plot.jpg", dpi = 300)

(rmnp_joy_white <- ggplot(transects,
                   aes(x = lon, y = lat, group = lat, height = elevation)) +
  geom_density_ridges(stat = "identity",
                      scale = 40,
                      fill = "white",
                      alpha = 0.2,
                      color = "black") +
  theme(text=element_text(family="Kanit"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white"),
        axis.line = element_blank(),
        axis.text.x = element_blank(),
        plot.background = element_rect(fill = "white"),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.x=element_text(colour="black")) +
  labs(x = "Rocky Mountain National Park"))
ggsave("/Users/leighannganzar/Desktop/Post-Doc/RMNP/RMNP-elevation/white_plot.jpg", dpi = 300)

