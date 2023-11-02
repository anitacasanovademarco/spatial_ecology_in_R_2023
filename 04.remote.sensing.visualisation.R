# SATELLITE DATA VISUALIZING
# Remote sensing
# Where to store the packages? GitHub (not connected to R: it's not controlled) or CRAN (directly conencted to R: it's controlled)

# to install in CRAN (Coomprehensive R Archive Network), the fucntion is:
install.packages("devtools")
install.packages("terra")

# to open the packages (also called libraries in R) we use the function:
library (devtools) 
library (terra) # 5 year-old package

# to install the imageRy package from GitHub 
install_github("ducciorocchini/imageRy")  
library (imageRy)


im.list() #allows to see al the possible images from the imageRy package

# choose one and import it with the im.import function
b2 <- im.import("sentinel.dolomites.b2.tif")

#Information from the image (reference system): Word Geodetic System, Universal Transverse Mercator, Coordination of the point + the emisphere (N or S)
# to know more, you can go to Sentinel-2 in Wikipedia

clb <- colorRampPalette(c("dark grey", "grey", "light grey")) (100)
plot(b2,col=clb)

# STACK IMAGES: function that puts all the plots in the same object (in this case, four bands all together)


# Presentation 7
# ACTIVE SENSORS: they start with their own energy, as they get back informations after releasing energy
# PASSIVE SENSORS: the enrgy comes from an externa source, the light: in the atmosphere there is a scarrening phenomenon of light. The object reflected light is captured by the sensor
# REFLECTANCE (from 0 to 1): ration between the reflected energy and the incident energy (0 is for absrobing surfaces, black coloured)


# Excercise: plot in a multiframe the bands with different color maps
c1 <- colorRampPalette(c("black", "grey", "white")) (100)
c2 <- colorRampPalette(c("purple", "pink", "white")) (100)
c3 <- colorRampPalette(c("dark green", "light green", "white")) (100)
c4 <- colorRampPalette(c("blue", "light blue", "white")) (100)

par(mfrow=c(2,2))
plot(b2,col=c1)
plot(b3,col=c2)
plot(b4,col=c3)
plot(b8, col=c4) 

# RGB SPACE = Red, Green and Blue components that build other colours by overlapping
im.plotRGB(stack_sent, r = 3, g = 2, b = 1) #red is the third element, as  the order we analysed them was:
# b2 (blue), b3 (green), b4 (red), b8 (NIR)



