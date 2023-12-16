library (ncdf4)
library(terra)

setwd("/Users/anita/Desktop/Unibo/Courses/1st YEAR/1st SEMESTER/Spatial Ecology in R/Exam project spatial") 


#Find where the two satellite images overlap
plot(SSM2023[[1]]+SSM2015[[1]])

#Assign to one of these intervals the function that will crop them

ext<-c(-7,-4,37, 41) 

# SURFACE SOIL MOISTURE VALBELLUNA 2023
SSM2023<-rast("c_gls_SSM1km_202307010000_CEURO_S1CSAR_V1.2.1.nc")
SSM2023

plot(SSM2023)

plot(SSM2023[[1]]) #remove the noise

cl<-colorRampPalette(c("red", "orange", "yellow"))(100)
plot(SSM2023[[1]], col=cl)

SSM2023crop<-crop(SSM2023[[1]],ext)

plot(SSM2023crop, col=cl)  


# SURFACE SOIL MOISTURE VALBELLUNA 2015
SSM2015<-rast("c_gls_SSM1km_201507010000_CEURO_S1CSAR_V1.1.1.nc")
SSM2015

plot(SSM2015)

plot(SSM2015[[1]]) #remove the noise

SSM2015crop<-crop(SSM2015[[1]],ext) 

plot(SSM2015crop, col=cl) 

# MULTIFRAME
par(mfrow=c(1,2))
plot(SSM2023crop, col=cl)  
plot(SSM2015crop, col=cl) 

