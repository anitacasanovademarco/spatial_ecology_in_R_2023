########## SPECIES DISTRIBUTION

install.packages("sdm")
install.packages("rgdal", dependencies=T) #now rgdal is inside terra package

#OPEN THE DOWNLOADED PACKAGES (no more quotes cause now they're inside R)
library(sdm) # sdm = species distribution modelling
library(terra) # used for spatial functions (predictors)
library(rgdal) # gdal = translator library for raster and vector geospatial data formats 

#SELECT THE FILE INSIDE A PACKAGE
file <- system.file("external/species.shp", package="sdm") #inside sdm there's external, which contains the file "species.shp"

# shp = files usually called VECTOR FILES, that are series of coordinates

species <- vect(file) #let's import a vector of  this file: if we run it we get a COORDINATE SYSTEM

#to see Occurrence just link the vector to Occurrence, like this
species$Occurrence # PRESENCE-ABSENCE DATA
#0 is an uncertain data because maybe she's hidden, so let's take it in this case like a REAL 0

plot(species)

#SELECT ONLY PRESENCES OR ABSENCES

pres<-species[species$Occurrence==1,]  #we write 1 cause we need the 1 value, which is the presence
species[species$Occurrence==1,]
plot(pres)
abs<-species[species$Occurrence==0,] #or
abs<-species[species$Occurrence=!1,]
plot(abs)

#PLOT PRESENCES AND ABSENCES, one beside the other (like last time)
par(mfrow=c(1,2))
plot(pres)
plot(abs)

#TO CLOSE THE GRAPHIC
dev.off()

#PLOT PRESENCES AND ABSENCES IN TWO DIFFERENT COLORS, one beside the other
par(mfrow=c(1,2))
plot(pres, col="dark blue")
plot(abs, col="light blue")

#PLOT PRESENCES AND ABSENCES TOGETHER, do so:
plot(pres, col="dark blue")
points(abse, col="light blue")

#PREDICTORS: environmental variables

#Elevation predictor
elev <- system.file("external/elevation.asc", package="sdm") #asc is an extention and it's a type of file, like png 
elevmap <-rast(elev) #to import the file, like vec before: now we get an image because we wrote rast instead of  like an image, we write rast, and not vec anymore, like before
plot(elevmap)
points(pres,cex=0.5) #we see that the specie, which is in this case, Rana temporaria, is avoiding a valley. More, it's not choosing very low and very high elevations

#Temperature predictor
temp <- system.file("external/temperature.asc", package="sdm") #asc is an extention and it's a type of file, like png 
tempmap <-rast(temp) #to import the file, like vec before: now we get an image because we wrote rast instead of  like an image, we write rast, and not vec anymore, like before
plot(tempmap)
points(pres,cex=0.5)

#Vegetational cover
veg <- system.file("external/vegetation.asc", package="sdm") 
vegmap <-rast(veg) 
plot(vegmap)
points(pres,cex=0.5)

#Precipitation
prec <- system.file("external/precipitation.asc", package="sdm") 
precmap <-rast(prec) 
plot(precmap)
points(pres,cex=0.5)

#Final multiframe
par(mfrow=c(2,2))

 #elevation
plot(elevmap)
points(pres,cex=0.5)

#temperature
plot(tempmap)
points(pres,cex=0.5)

#vegetation
plot(vegmap)
points(pres,cex=0.5)

#precipitation
plot(precmap)
points(pres,cex=0.5)




