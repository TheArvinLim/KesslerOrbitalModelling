library(tidyverse)
library(data.table)
rm(list=ls())

setwd("C:/Users/Louii/OneDrive/Other/Kessler/KesslerOrbitalModelling/GMAT Report Files")

data <- read.table("0uN.txt",header=TRUE) %>% 
  mutate(signal=DefaultSC.Earth.Latitude > 0 & lag(DefaultSC.Earth.Latitude) < 0)

data$orbNum = cumsum(data$signal)

s0un <- data %>% 
  group_by(orbNum) %>%
  summarise(time=min(DefaultSC.A1ModJulian), max_alt=max(DefaultSC.Earth.Altitude),min_alt=min(DefaultSC.Earth.Altitude),mean_alt=mean(DefaultSC.Earth.Altitude),
            max_ECC=max(DefaultSC.Earth.ECC),min_ECC=min(DefaultSC.Earth.ECC),mean_ECC=mean(DefaultSC.Earth.ECC))

data <- read.table("20uN.txt",header=TRUE) %>% 
  mutate(signal=DefaultSC.Earth.Latitude > 0 & lag(DefaultSC.Earth.Latitude) < 0)

data$orbNum = cumsum(data$signal)

s20un <- data %>% 
  group_by(orbNum) %>%
  summarise(time=min(DefaultSC.A1ModJulian), max_alt=max(DefaultSC.Earth.Altitude),min_alt=min(DefaultSC.Earth.Altitude),mean_alt=mean(DefaultSC.Earth.Altitude),
            max_ECC=max(DefaultSC.Earth.ECC),min_ECC=min(DefaultSC.Earth.ECC),mean_ECC=mean(DefaultSC.Earth.ECC))


#plot(s0un$time, s0un$mean_alt, ylim=c(min(s20un$min_alt), max(s0un$max_alt)))
#points(s0un$time, s0un$min_alt)
#points(s0un$time, s0un$max_alt)
plot(data$DefaultSC.A1ModJulian, data$DefaultSC.Earth.Altitude)
points(s20un$time, s20un$mean_alt, col="red")
#points(s20un$time, s20un$min_alt, col="red")
#points(s20un$time, s20un$max_alt, col="red")

