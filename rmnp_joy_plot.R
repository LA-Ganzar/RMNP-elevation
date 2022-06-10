# RMNP Joy Plot
# LAG 
# 2022-06-10

library(tidyverse)
library(ggridges)

# Load data from QGIS processing
transects <- readr::read_csv("/Users/leighannganzar/Desktop/Post-Doc/RMNP/RMNP-elevation/data/coords.csv")

# Rename columns
transects <- transects %>%
  rename(elevation = rmnp_eleva,
         lon = x,
         lat = y)

# Plot
rmnp_joy <- ggplot(transects,
                   aes(x = lon, y = lat, group = lat, height = elevation)) +
  geom_density_ridges(stat = "identity",
                      scale = 30,
                      fill = "black",
                      color = "white") +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "black"),
        axis.line = element_blank(),
        axis.text.x = element_blank(),
        plot.background = element_rect(fill = "black"),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.x = element_blank(),
        plot.caption = element_text(color = "white")) +
  labs(caption = "Rocky Mountain National Park")
rmnp_joy

