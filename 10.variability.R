# Measurement of R based variability

library (imageRy)
library(terra)
library(viridis)

im.list()

sent <- im.import("sentinel.png") #Similaun Glacier

# band 1 = NIR
# band 2 = red
# band 3 = green

im.plotRGB(sent, r = 1, g = 2, b = 3)

#snow in white, lake in black

im.plotRGB(sent, r = 2, g = 1, b = 3)

nir <- sent[[1]]
plot(nir) #8 bit image as it distributed in a range between 0 and 250

#MOVING WINDOW APPROACH FOR DIVERSITY ASSESSMENT.
#we are going to calculate the standard devitian of windows of pixels, one at the time
#in the end we would have passed the window in the whole image, and we will calculate each time the central value of the image

#calulcate the standard deviation with the function: focal()

sd1 <- focal(nir, matrix(1/9,3,3), fun=sd) #avoid givid the name sd without numbers cause it can be confused with the value of the standard deviation

#use of the nir band, matrix describes the dimension of the moving window. it is composed by 9 pixels, so they go from 1 to 9 (written as 1/9). In general we use squared matrices. The function calculated is the standard deviation (sd).

plot(sd1)

cl<-colorRampPalette(viridis(7))(255) #the 7th palette of viridis, with 255 different colors used

plot(sd1, col=cl)

