
# MA 415/615 HW6 
# Name: Ziran Min
# Email: minziran@bu.edu
# BUID: U59274427
# Data: 03/26/2018

library(ggmap)
library(tidyverse)

# Find the town of Bude in Western England.
gc1 <- geocode("Bude, England")
map1 <- get_map(gc1)

ggmap(map1) + geom_point(aes(x = lon, y = lat), data = gc1, color = "red", size = 3)

# Road Map of Bude
road_bude <- get_map(gc1, zoom= 14, maptype = "roadmap")
Road1 <- ggmap(road_bude) + geom_point(aes(x = lon, y = lat), data = gc1, color = "red", size = 3) +
  geom_text(aes(x = lon, y = lat, label="Bude"), data = gc1, color = "black", vjust = 1.5, size = 3)
Road1

# Watercolor Map of Bude
water_bude <- get_map(gc1, zoom= 14, maptype = "watercolor")
Water1 <- ggmap(water_bude) + geom_point(aes(x = lon, y = lat), data = gc1, color = "red", size = 3)+
  geom_text(aes(x = lon, y = lat, label="Bude"), data = gc1, color = "black",vjust=1.5, size = 3)
Water1

# Beach 1, Summerleaze Beach
gc2 <- geocode("Summerleaze Beach, Bude")
map2 <- get_map(gc2, zoom = 15)

ggmap(map2) + geom_point(aes(x = lon, y = lat), data = gc2, color = "orange", size = 3)

Road2 <- Road1 + geom_point(aes(x = lon, y = lat), data = gc2, color = "orange", size = 3)
Road2

Water2 <- Water1 +  geom_point(aes(x = lon, y = lat), data = gc2, color = "orange", size = 3) +
      geom_text(aes(x = lon, y = lat, label="Summerleaze Beach"), data = gc2, color = "black",hjust=1.05,size = 3)
Water2

# Beach 2 Crooklets Beach
gc3 <- geocode("Crooklets Beach, Bude")
map3 <- get_map(gc3, zoom = 15)

ggmap(map3) + geom_point(aes(x = lon, y = lat), data = gc3, color = "yellow", size = 3) 

Road3 <- Road2 + geom_point(aes(x = lon, y = lat), data = gc3, color = "yellow", size = 3) 
Road3

Water3 <- Water2 + geom_point(aes(x = lon, y = lat), data = gc3, color = "yellow", size = 3) +
  geom_text(aes(x = lon, y = lat, label="Crooklets Beach"), data = gc3, color = "black",hjust=1.05,size = 3)
Water3

# Cricket Ground
gc4 <- geocode("Bude North Cornwall Cricket Club, Bude")
map4 <- get_map(gc4, zoom = 15)

ggmap(map4) + geom_point(aes(x = lon, y = lat), data = gc4, color = "blue", size = 3) +
  geom_text(aes(x = lon, y = lat, label="Bude North Cornwall Cricket Club"), data = gc4, hjust=1.05,size=3)

Road4 <- Road3 + geom_point(aes(x = lon, y = lat), data = gc4, color = "blue", size = 3) +
  geom_text(aes(x = lon, y = lat, label="Bude North Cornwall Cricket Club"), data = gc4, hjust=1.05,size=3)
Road4

Water4 <- Water3 + geom_point(aes(x = lon, y = lat), data = gc4, color = "blue", size = 3) +
  geom_text(aes(x = lon, y = lat, label="Bude North Cornwall Cricket Club"), data = gc4, hjust=1.05,size=3)
Water4


# Bar
gc5 <- geocode("Bar 35, Bude")
map5 <- get_map(gc5, zoom = 15)

ggmap(map5) + geom_point(aes(x = lon, y = lat), data = gc5, color = "purple", size = 3) +
  geom_text(aes(x = lon, y = lat, label="Bar 35"), data = gc5, vjust=1.4, hjust=0.5,size=3)

Road5 <- Road4 + geom_point(aes(x = lon, y = lat), data = gc5, color = "purple", size = 3) +
  geom_text(aes(x = lon, y = lat, label="Bar 35"), data = gc5, vjust=1.4, hjust=0.5,size=3)
Road5

Water5 <- Water4 + geom_point(aes(x = lon, y = lat), data = gc5, color = "purple", size = 3) +
  geom_text(aes(x = lon, y = lat, label="Bar 35"), data = gc5, vjust=1.4, hjust=0.5,size=3)
Water5



# Path from Cricket Club to Bar
from <- "Bude North Cornwall Cricket Club, Bude"
to <- "Bar 35, Bude"
route_df <- route(from, to, structure = "route", mode = "walking")

map6 <- get_map(gc1, zoom = 15)
ggmap(map6) + geom_path(aes(x = lon, y = lat), colour = "skyblue", size = 1.5, data = route_df, lineend = "round") +
  geom_point(aes(x = lon, y = lat), data = gc5, color = "purple", size = 3) +
  geom_text(aes(x = lon, y = lat, label="Bar 35"), data = gc5, vjust=1.4, hjust=0.5,size=3) +
  geom_point(aes(x = lon, y = lat), data = gc4, color = "blue", size = 3) +
  geom_text(aes(x = lon, y = lat, label="Bude North Cornwall Cricket Club"), data = gc4, hjust=1.05,size=3)

Road6 <- Road5 + geom_path(aes(x = lon, y = lat), colour = "skyblue", size = 1.5, data = route_df, lineend = "round") +
  geom_point(aes(x = lon, y = lat), data = gc5, color = "purple", size = 3) +
  geom_text(aes(x = lon, y = lat, label="Bar 35"), data = gc5, vjust=1.4, hjust=0.5,size=3) +
  geom_point(aes(x = lon, y = lat), data = gc4, color = "blue", size = 3) +
  geom_text(aes(x = lon, y = lat, label="Bude North Cornwall Cricket Club"), data = gc4, hjust=1.05,size=3)
Road6

Water6 <- Water5 + geom_path(aes(x = lon, y = lat), colour = "skyblue", size = 1.5, data = route_df, lineend = "round") +
  geom_point(aes(x = lon, y = lat), data = gc5, color = "purple", size = 3) +
  geom_text(aes(x = lon, y = lat, label="Bar 35"), data = gc5, vjust=1.4, hjust=0.5,size=3) +
  geom_point(aes(x = lon, y = lat), data = gc4, color = "blue", size = 3) +
  geom_text(aes(x = lon, y = lat, label="Bude North Cornwall Cricket Club"), data = gc4, hjust=1.05,size=3)
Water6











