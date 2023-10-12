# Why populations disperse over the landscape in a certain manner?
# install.packages("sdm")
# install.packages("rgdal", dependencies=T) #now rgdal is inside terra package

#we check the presence of this packages in open the packages we just downloaded without quotes cause now they're inside R
library(sdm) #exploratory analisys of Species Distribution Modelling (sdm)
library(terra) # used for spatial functions (predictors)
library(rgdal) # species

#GDAL is a translator library for raster and vector geospatial data formats that is released 
#under an MIT style Open Source License by the Open Source Geospatial Foundatio

#SEARCH A FILE INSIDE A PACKAGE
file <- system.file("external/species.shp", package="sdm") #inside sdm there's external, which contains the file "species.shp"
system.file("external/species.shp", package="sdm") #inside sdm there's external, which contains the file "species.shp"

# SHP files are usually called VECTOR FILES, that are series of coordinates

species <- vect(file) #let's make a vector of the information contained in this file: if we run it we get COORDINATE SYSTEM
#to see Occurrence just link the vector to Occurrence, like this
species$Occurrence #code presences and absences: PRESENCE-ABSENCE DATA
#0 is an uncertain data because maybe she's hidden, so let's take it in this case like a REAL 0

plot(species)

#SELECT ONLY PRESENCES OR ABSENCES

