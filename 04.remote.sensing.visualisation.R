# Remote sensing
install.packages("devtools") #This package is inside the CRAN (Coomprehensive R archive network)
install.packages("terra")
library(devtools) 
library(terra)
library(imageRy)

#For installing packages from another site, like GitHub, we use the function
devtools::install_github("ducciorocchini/imageRy")


im.list() #list of all the images we can import
b2 <- im.import("sentinel.dolomites.b2.tif")
b2 #some information about it: the picture has a huge resolution, as it has 1 000 000 pixels

