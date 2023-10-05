# Code related to population growth

# Let's install spatstat, which allows us to make a spatial point pattern analisys

install.packages("spatstat") #the quotes are needed because the package we want to install is outside R

library(spatstat) # to chekc if the package has already been installed

# Let's see how a population is pointed in space

# we are using data from outside R, in order to previously understand how they work

# Let's use the bei data:

#data description:

#https://cran.r-project.org

# plotting the data
plot(bei) # as the points are too big for this area, we'll change their shame

# changing dimension - cex
plot(bei,cex=.5)

# why are the trees clumbed in some area?

#changing the symbol  - pch
plot(bei,cex=.2,pch=19)

# additional datasets
bei.extra # it has two elements: elevation and grad

plot(bei.extra) #here we have the raster file

# Let's use only part of the dataset: elev
bei.extra$elev  #$ sign links elevation to the dataset
plot(bei.extra$elev) 
elevation <- plot(bei.extra$elev)  #elevation has been assignet to an homonimous object, simple to find
bei.extra[1] #take the fist element, so it's anothe way to isolate elevation
elevation2 <- bei.extra[[1]]








