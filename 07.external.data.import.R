library(terra)

#first step: explain to R which folder we are gonna use 
#this is called the WORKING DIRECTORY
#use the function
setwd("/Users/anita/Desktop") #if we use always the same folder, the command working directory will be always the same

# Import the data using the function rast

Najaf2003 <- rast("najafiraq_etm_2003140_lrg.jpg") #like function im.import

# plotting it
plotRGB( Najaf2003, r=1, g=2, b=3)
Najaf2023 <- rast("najafiraq_oli_2023219_lrg.jpg")
plotRGB( Najaf2023, r=1, g=2, b=3)

# plot them together
par(mfrow=c(2,1))
plotRGB( Najaf2003, r=1, g=2, b=3)
plotRGB( Najaf2023, r=1, g=2, b=3)

dev.off()
# multitemporal change detection
Najaf_time<-Najaf2003[[1]]-Najaf2023[[1]]
cl<-colorRampPalette(c("brown", "grey", "orange")) (100)
plot(Najaf_time,col=cl)

#Importing my own image
snow<-rast("rockiesfirstsnow_tmo_2023288_lrg.jpg")
plotRGB(snow,1,2,3)
plotRGB(snow,2,1,3)
plotRGB(snow,3,2,1)

#My multitemporal change detection
lakepowell22<-rast("lakepowell_oli2_2022267_lrg.jpg")
lakepowell23<-rast("lakepowell_oli_2023293_lrg.jpg")
lakepowell_time<-lakepowell22[[1]]-lakepowell23[[1]]
plot(lakepowell_time,col=cl)

install.packages("ncdf4")
