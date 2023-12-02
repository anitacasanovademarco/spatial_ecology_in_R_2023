# TIME SERIES are series of data (images) scattered in time 
library(terra)
library(imageRy)
im.list()

# COVID effects on the environment: nitrogen concentration from january to march 2020
EN01<-im.import("EN_01.png") #European Nitrogen
EN13<-im.import("EN_13.png")

par(mfrow=c(2,1))
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN13)

#Let's make the difference between the red bands of the first two images
dev.off()
diff=EN01[[1]]-EN13[[1]]
plot(diff)

col <- colorRampPalette(c('red','orange','yellow'))(100)  
#Reminder: blue and red or green and red aren't good for dalthonic people
cl <- colorRampPalette(c('blue','white','red'))(100) 
plot(diff,col=cl) 
#blue = is higher in march, red = is higher in january
#we see that in many cities people stopped to use cars
#so we have a huge decrease in march

# CHANGES IN TEMPERATURE of Greenland ice sheet

dev.off()
im.list()
G2000<-im.import("greenland.2000.tif") #16 bits image
plot(G2000,col=cl) #temperature on the surface of the land
#blue=almost perennial ice cap

G2005<-im.import("greenland.2005.tif")
G2010<-im.import("greenland.2010.tif")
G2015<-im.import("greenland.2015.tif")

plot(G2005,col=cl)
plot(G2010,col=cl)
plot(G2015,col=cl)

#to make it more effective
cl1 <- colorRampPalette(c('black', 'blue','white','red'))(100) 
plot(G2015,col=cl1)

dev.off()
par(mfrow=c(2,2))
plot(G2000,col=cl1)
plot(G2005,col=cl1)
plot(G2010,col=cl1)
plot(G2015,col=cl1)

#it's the same as

dev.off()
stackG<-c(G2000,G2005,G2010,G2015) #around 2000 there was the worst period
plot(stackG, col=cl1)

#or only the first and the last

par(mfrow=c(1,2))
plot(G2000,col=cl)
plot(G2015,col=cl)

#Make the difference between the first and the last element
diffg<-stackG[[1]]-stackG[[4]]
#it's the same as
difg<-G2000-G2015
plot(diffg, col=cl) 
#blue=temperature was lower in the past
#so there's a lost of low temperatures (so ice) and increase of temperature
#red= temperature was higher in the past

#Make a RGB plot using different years
dev.off()
im.plotRGB(stackG, r=1,g=2,b=3)
#blue = temperature was lower in the past (central part)
#green = temperture similar to the past
#red = temperature was higher in the past (external part)



