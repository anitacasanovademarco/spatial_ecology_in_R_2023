# Codes related to population growth

# Let's install spatstat, which allows us to make a SPATIAL POINT PATTERN ANALISYS

install.packages("spatstat") # QUOTES are needed to protect the package we want to install which is outside R

#the function library(spatstat) is used to check if the package has already been installed
library(spadstat)

# we are using data from outside R, in order to previously understand how they work

# Let's use the BEI DATA:

#data description:

#https://cran.r-project.org

# plotting the data of spatstat (see what it represents)
plot(bei) # as the points are too big for this area, we'll change their shame

# changing dimension - cex
plot(bei,cex=.5)

# why are the trees clumbed in some area?

#changing the symbol  - pch
plot(bei,cex=.2,pch=19)

# additional datasets
bei.extra # it has two variables: elevation (elev) and gradient (grad). They allow to understand the distribution of bei datas

plot(bei.extra) #here we have the raster file

# Let's use only part of the dataset: elev
bei.extra$elev  #$ sign links elevation to the dataset
plot(bei.extra$elev) 
elevation <- plot(bei.extra$elev)  #elevation has been assignet to an homonimous object, simple to find
bei.extra[1] #take the fist element, so it's anothe way to isolate elevation

#second method to select elements
elevation2 <- bei.extra[[1]]
plot(elevation2)

# pasing from points to a continuous surface (INTERPOLATION)
densitymap<-density(bei) #the densitymap gives us info about pixel
plot(densitymap)

#Let's put the bei points over the densitymap
points(bei, cex=.2)

#Avoid pictures with a combination of blue, green and red colors as daltonic people can't see them

#Let's change the colors
cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(100) #R is capital letters sensitive!!!
#100 represents the different colors that can be present between the colors chosen
plot(densitymap, col=cl)

#Use yellow colour in a proper way, cause it's the most impacting one

#the quality is much worse if we put a smaller number, like
cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(4) #R is capital letters sensitive!!!
#100 represents the different colors that can be present between the colors chosen
plot(densitymap, col=cl)

# MULTIFRAME (show two different plots contemporarely)
par(mfrow=c(1,2)) #1 row and 2 columns, and they're part of an array
# and then the two plots 
plot(densitymap)
plot(elev)

par(mfrow=c(2,1)) #2 rows and 1 column, and they're part of an array
# and then the two plots 
plot(densitymap)
plot(elev)















