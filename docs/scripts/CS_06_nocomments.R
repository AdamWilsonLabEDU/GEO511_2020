library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)

data(world)  #load 'world' data from spData package
tmax_monthly <- getData(name = "worldclim", var="tmax", res=10)
