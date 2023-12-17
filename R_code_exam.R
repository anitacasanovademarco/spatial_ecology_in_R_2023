library (ncdf4)
library(terra)

# SPATIO-ECOLOGICAL MONITORING IN THE VALBELLUNA AREA

# SURFACE SOIL MOISTURE CHANGE IN THE PERIOD JULY 2015 - JULY 2023 FROM COPERNICUS IMAGERY

#Set the working directory
setwd("/Users/anita/Desktop/Unibo/Courses/1st YEAR/1st SEMESTER/Spatial Ecology in R/Exam project spatial/imageRy") 

#Import the dataset with the function: rast ()
ssm2023<-rast("landsat.soil.moisture.2023.nc")
ssm2015<-rast("landsat.soil.moisture.2015.nc")

#Find where the two satellite images overlap
plot(ssm2023[[1]]+ssm2015[[1]])

#Assign to one of these intervals the function that will crop the images
ext<-c(-7,-4,37, 41) 

#SURFACE SOIL MOISTURE VALBELLUNA 2023 
ssm2023

plot(ssm2023)

plot(ssm2023[[1]]) #remove the noise

cl<-colorRampPalette(c("red", "orange", "yellow"))(100)
plot(ssm2023[[1]], col=cl)

ssm2023crop<-crop(ssm2023[[1]],ext)

plot(ssm2023crop, col=cl)  


#SURFACE SOIL MOISTURE VALBELLUNA 2015
ssm2015

plot(ssm2015)

plot(ssm2015[[1]]) #remove the noise

ssm2015crop<-crop(ssm2015[[1]],ext) 

plot(ssm2015crop, col=cl) 

#Build a multiframe with 1 row and 2 columns
par(mfrow=c(1,2))
plot(ssm2023crop, col=cl)  
plot(ssm2015crop, col=cl) 

dev.off()
###################is it possible to make a difference between the two?


# LAND COVER CHANGE IN THE PERIOD SEPTEMBER 2015 - SEPTEMBER 2023 FROM SENTINEL 2
#Same working directory as before: no need to recall it

#Import the dataset 
vb2023 <- rast("sentinel.valbelluna.2023.jpg") 
vb2015 <- rast("sentinel.valbelluna.2015.jpg") 

#Analyse them
vb2023
vb2015

#Plot them
plot(vb2023)
plot(vb2015)

#Plot them with RGB
plotRGB(VB2023, r=1, g=2, b=3)
plotRGB(VB2023, r=2, g=3, b=1)

plotRGB(VB2015, r=1, g=2, b=3)
plotRGB(VB2015, r=2, g=3, b=1)

#NIR images
#Import the dataset 
b2_2023 <- rast("sentinel.valbelluna.b2.2023.jpg") #Blue
b2_2023
plot(b2_2023) 

b3_2023 <- rast("sentinel.valbelluna.b3.2023.jpg") #Green
b3_2023
plot(b3_2023) 

b4_2023 <- rast("sentinel.valbelluna.b4.2023.jpg") #Red
b4_2023
plot(b4_2023) 

b8_2023 <- rast("sentinel.valbelluna.b8.2023.jpg") 
b8_2023
plot(b8_2023) 

b2_2015 <- rast("sentinel.valbelluna.b2.2015.jpg") 
b2_2015
plot(b2_2015) 

b3_2015 <- rast("sentinel.valbelluna.b3.2015.jpg") 
b3_2015
plot(b3_2015) 

b4_2015 <- rast("sentinel.valbelluna.b4.2015.jpg") 
b4_2015
plot(b4_2015) 

b8_2015 <- rast("sentinel.valbelluna.b8.2015.jpg") 
b8_2015
plot(b8_2015) 

##################Information provided from the image (called Reference System): 
# Word Geodetic System, Universal Transverse Mercator, Coordination of the point + the emisphere (N or S)

##########i colori vanni bene??

#Multiframe
c1 <- colorRampPalette(c("white", "blue", "darkblue")) (100)
c2 <- colorRampPalette(c("white", "green", "darkgreen")) (100)
c3 <- colorRampPalette(c("white", "red", "darkred")) (100)
c4 <- colorRampPalette(c("white", "darkred", "black")) (100)

par(mfrow=c(2,2)) #2023
plot(b2_2023,col=c1)
plot(b3_2023,col=c2)
plot(b4_2023,col=c3)
plot(b8_2023, col=c4) 
dev.off()

#Comparison between 2015 and 2023
stack_sent_2015 <- c(b2_2015,b3_2015,b4_2015,b8_2015) #2015
im.plotRGB(stack_sent_2015, r = 3, g = 2, b = 1) # our view
im.plotRGB(stack_sent_2015, r=3, g=4, b=2) #with infrared (vegetation becomes green, we get more information)

stack_sent_2023 <- c(b2_2023,b3_2023,b4_2023,b8_2023) #2023
im.plotRGB(stack_sent_2023, r = 3, g = 2, b = 1) # our view
im.plotRGB(stack_sent_2023, r=3, g=4, b=2) #with infrared

par(mfrow=c(1,2))
im.plotRGB(stack_sent_2015, r=3, g=4, b=2) 
im.plotRGB(stack_sent_2023, r=3, g=4, b=2)

#Correlation between the bands
pairs(stack_sent)

dev.off()
#Multitemporal change detection
Najaf_time<-Najaf2003[[1]]-Najaf2023[[1]]
cl<-colorRampPalette(c("brown", "grey", "orange")) (100)
plot(Najaf_time,col=cl)


#My multitemporal change detection
lakepowell22<-rast("lakepowell_oli2_2022267_lrg.jpg")
lakepowell23<-rast("lakepowell_oli_2023293_lrg.jpg")
lakepowell_time<-lakepowell22[[1]]-lakepowell23[[1]]
plot(lakepowell_time,col=cl)

install.packages("ncdf4")

#################calculate NDVI



