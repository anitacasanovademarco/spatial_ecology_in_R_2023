# Remote sensing
#where to store the packages? GitHub (not connected to R: it's not controlled) or CRAN (directly conencted to R: it's controlled)
#to install in CRAN (Coomprehensive R Archive Network), the fucntion is:
install.packages("devtools")
install.packages("terra")
library(devtools) 
library(terra)
library(imageRy)

#to install packages in GitHub, the function is:
devtools::install_github("ducciorocchini/imageRy")


im.list() #list of all the images we can import
b2 <- im.import("sentinel.dolomites.b2.tif")
b2 #some information about it: the picture has a huge resolution, as it has 1 000 000 pixels

