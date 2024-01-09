# Final script inclusing all the different scripts during lectures

# ----------------------

# Smmmary:
# 01 Beginning
# 02.1 Population densities
# 02.2 Population distribution
# 03 Community multivariate analysis
# 

# ----------------------

# 01 Beginning

# Here I can write anything I want

# R as a caluclator
3+4

# Assign to an object
zima <- 2 + 3

duccio <- 5 + 3

# Calculations
zima * duccio
final <- zima * duccio


##### Array
# they're functions
# fuctions always have parenthesis and inside them there're the arguments

# Examples
sophi <- c(10,20,30,50,70) # microplastics
paula <- c(100, 500, 600, 1000, 2000) #people

# we can plot them together
plot(paula, sophi, xlab="number of people", ylab="microplastics")

# we can also previously assign paula and sophi to some objects
people <- paula
microplastics <- sophi
plot (people, microplastics, pch=19, cex=2, col="blue") # pch gives the shape of the symbols in R, cex represents the size, col for the color

# we can find the symbols in this site:

# http://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r

# ----------------------

# 02.1 Population densities

# Codes related to POPULATION GROWTH

# Let's install spatstat, which allows us to make a SPATIAL POINT PATTERN ANALISYS

install.packages("spatstat") # QUOTES are needed to protect the package we want to install which is outside R

#the function library(spatstat) is used to check if the package has already been installed
library(spatstat)

# we are using data in GitHub, which is  outside R, in order to previously understand how they work

#DATA DESCRIPTION
# Let's use some datasets provided by spatstat, like BEI DATA 
#(The dataset bei gives the positions of 3605 trees of the species Beilschmiedia pendula (Lauraceae) 
# in a 1000 by 500 metre rectangular sampling region in the tropical rainforest of Barro Colorado Island)

# PLOTTING  DATA FROM SPATSTAT (see what it represents)
plot(bei) 
# as the points are too big for this area, we'll change their shape

# CHANGING DATA DIMENSION - cex
plot(bei,cex=.5)

# why are the trees clumbed in some area?

#CHANGING THE SYMBOL  - pch
plot(bei,cex=.2,pch=19) #search the number of R symbols on the internet

#ADDITIONAL DATASETS
bei.extra # it has two variables: elevation (elev) and gradient (grad). 
# They allow us to understand the distribution of bei datas

plot(bei.extra) #here we have the raster file =! vector file

# Let's use only part of the dataset: elev
bei.extra$elev  #$ sign links elevation to the dataset
plot(bei.extra$elev) 
elevation <- plot(bei.extra$elev)  #elevation has been assignet to an homonimous object, simple to find

#second method to select elements
bei.extra[1] #take the fist element, so it's another way to isolate elevation
elevation2 <- bei.extra[[1]]
plot(elevation2)

# INTERPOLATION: passing from points to a continuous surface 
densitymap<-density(bei) #the densitymap gives us info about the distribution of pixel
plot(densitymap)

#Let's overlap  bei points to the densitymap
points(bei, cex=.2)

#Avoid pictures with a combination of blue, green and red colors as daltonic people can't see them

#Let's change the colors
# You can find them in this website:
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(100) #R is capital letters sensitive!!!
#100 represents the different colors that can be present between those chosen
plot(densitymap, col=cl)

#Use yellow colour in a proper way, cause it's the most impacting one

#the quality is much worse if we put a smaller number, like
cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(4)
plot(densitymap, col=cl)

# MULTIFRAME (shows different plots at the same time)
par(mfrow=c(1,2)) #1 row and 2 columns, and they're part of an array
# and then the two plots 
plot(densitymap)
plot(elev)

par(mfrow=c(2,1)) #2 rows and 1 column, and they're part of an array
# and then the two plots 
plot(densitymap)
plot(elev)

# ----------------------

# 02.2 Population distribution

# why populations disperse in a certain manner over the landscape?
#INSTALL PACKAGES (with quotes cause they're outside R)
install.packages("sdm")
install.packages("rgdal", dependencies=T) #Warning Message: rgdal will be retired cause it'll be included in terra package

#OPEN THE DOWNLOADED PACKAGES (no more quotes cause now they're inside R)
library(sdm) # Species Distribution Modelling
library(terra) # spatial predictors, that are environmental variables
library(rgdal) # translator library for raster and vector geospatial data formats 

#SELECT THE FILE INSIDE THE PACKAGE sdm
file <- system.file("external/species.shp", package="sdm") 
# sdm have vector files and images

#########let's import a vector, which is a coordinate system (function: vect)
species <- vect(file) 

#to see Occurrence just link the vector to Occurrence with the $
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

######let's import an image (function: rast)
#Elevation predictor
elev <- system.file("external/elevation.asc", package="sdm") #asc is an extention of sdm and it's a type of file, like png 
elevmap <-rast(elev) 
plot(elevmap)
points(pres,cex=0.5) #we see that the specie, which is in this case, Rana temporaria, is avoiding a valley. More, it's not choosing very low and very high elevations

#Temperature predictor
temp <- system.file("external/temperature.asc", package="sdm") 
tempmap <-rast(temp) 
plot(tempmap)
points(pres,cex=0.5)

#Vegetational cover
veg <- system.file("external/vegetation.asc", package="sdm") 
vegmap <-rast(veg) 
plot(vegmap)
points(pres,cex=0.5)

#Precipitation predictor
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

# ----------------------

# 03 Community multivariate analysis

#In communities, species are overlapping in space and time
# MULTIVARIATE ANALISYS of how species are related in SPACE 

#Vegetation Analisys
install.packages("vegan")
library(vegan)
data(dune) 
# Dune is a data frame of observations of 30 species at 20 sites. 
# The species names are abbreviated to 4+4 letters.

dune #to see the dataset
#or
head(dune) #just the first 6 rows
tail(dune) #just the last 6 rows
#we see a matrix of amout of individuals present in every plot

ord<-decorana(dune) #decorana function from the package vegan gives the Detrended Correspoondace Analysis
# DCA is a multivariate statistical technique used by ecologists to find the main factor or gradient in species-rich but sparse data matrices that tipify ecological community data. 
#we have to know the length of the new axes

ldc1 = 3.7004 #length decorana 1
ldc2 = 3.1166 
ldc3 = 1.30055 
ldc4 = 1.47888
total = ldc1 + ldc2 + ldc3 + ldc4

pldc1 = ldc1 * 100/total #percentage of every axes
pldc2 = ldc2 * 100/total
pldc3 = ldc3 * 100/total
pldc4 = ldc4 * 100/total

pldc1
pldc2
pldc3
pldc4

#as pldc1 + pldc2 represent the 70% of the total, we can also keep them only

plot(ord) 
# names represent species (we see coupling species), numbers represent plots: everything is depicted in a new dimention made by dca1 and 2
# from the table we can understand the environments

# ----------------------






























