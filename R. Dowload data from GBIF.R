# GBIF 

# Welcome to the bug's world of data! Let's crunch some numbers and not insects. 
#Happy coding!

#This script is purpose-built to harness the extensive biodiversity data available 
#through the Global Biodiversity Information Facility (GBIF), facilitated by the 
#robust rgbif R library. GBIF, a global initiative supported by various governments, 
#provides an unparalleled repository of information about the diverse forms of life on Earth.

#Example using Apis mellifera (bee)

library(rgbif)
library(ggplot2)
library(raster)

occ <- occ_data(scientificName = 'Apis mellifera',  #Obtaining occurrence data for Apis mellifera
                limit = 20000, 
                hasCoordinate = TRUE, 
                hasGeospatialIssue = FALSE)

colnames(occ$data) # View downloaded data (columns) 
occ_col <- filter(occ$data, country == 'Colombia') #Filter by country  
shp <- raster::getData('GADM', country = 'COL', level = 1) #Download geographic data 
gg <- ggplot() + #Create the map 
  geom_point(data = occ_col, aes(x = decimalLongitude, y = decimalLatitude), color = 'black') +
  geom_polygon(data = shp, aes(x = long, y = lat, group = group), color = 'grey', fill = NA) +
  coord_fixed(ylim = c(-5, 12.5), xlim = c(-80, -67)) +
  xlab('Longitud') +
  ylab('Latitud')

print(gg) #Show the map 

