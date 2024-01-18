
# This is an R project about a spatio-ecological multitemporal analysis in the Valbelluna area (BL, Italy), for the Spatial Ecology in R - Monitoring Ecosystem Changes and Functioning Master course. 
# The change in two environmental parameters was analysed: Surface Soil Moisture and Vegetation Cover.


library (ncdf4)
library(terra)
library(ggplot2)
library(viridis)
library(patchwork)
library(imageRy)



# SURFACE SOIL MOISTURE CHANGE IN THE PERIOD JULY 2015 - JULY 2023 FROM COPERNICUS IMAGERY

# set the working directory
setwd("/Users/anita/Desktop/Unibo/Courses/1st YEAR/1st SEMESTER/Spatial Ecology in R/Exam project spatial/imageRy") 

# import the dataset with the function: rast ()
ssm2023 <- rast("copernicus.soil.moisture.2023.nc")
ssm2015 <- rast("copernicus.soil.moisture.2015.nc")

# find where the two satellite images overlap
plot(ssm2023[[1]] + ssm2015[[1]])

# assign to one of these intervals the function that will crop the images
ext <- c(-7,-4,37, 41) 



# SURFACE SOIL MOISTURE VALBELLUNA 2015
ssm2015

plot(ssm2015) # the product is displayed in a regular latitude/longitude grid

plot(ssm2015[[1]]) # remove the noise 

cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(100)
cl1 <- colorRampPalette(c("white", "lightblue", "blue"))(100)

plot(ssm2015[[1]], col=cl)

ssm2015crop <- crop(ssm2015[[1]],ext) 

plot(ssm2015crop, col=cl) 



# SURFACE SOIL MOISTURE VALBELLUNA 2023 
ssm2023

plot(ssm2023)

plot(ssm2023[[1]]) #remove the noise

plot(ssm2023[[1]], col=cl)

ssm2023crop <- crop(ssm2023[[1]],ext)

plot(ssm2023crop, col=cl)  



# build a multiframe with 1 row and 2 columns
par(mfrow=c(1,2))
plot(ssm2023crop, col=cl)  
plot(ssm2015crop, col=cl) 
dev.off()



# difference between the two
diff.ssm <- ssm2015crop - ssm2023crop
plot(diff.ssm, col=cl1) # blue = higher in the past, white higher now







# MULTITEMPORAL LAND COVER CHANGE DETECTION IN THE PERIOD AUGUST 2018 - AUGUST 2023 FROM SENTINEL 2
# same working directory as before: no need to recall it

# import the dataset 
tc2018 <- rast("tc2018.jpg") # true color image from 2018
tc2023 <- rast("tc2023.jpg") # true color image from 2023

fc2018 <- rast("fc2018.jpg") # false color image from 2018
fc2023 <- rast("fc2023.jpg") # false color image from 2023

# analyse them
tc2018
tc2023
fc2018
fc2023

# plot them
par(mfrow=c(2,1))
plot(tc2018)
plot(tc2023)

par(mfrow=c(2,1))
plot(tc2018)
plot(tc2023)
plot(fc2018)
plot(fc2023)

# plot them with RGB
plotRGB(tc2018, r=1, g=2, b=3)
plotRGB(tc2018, r=2, g=3, b=1) # change bands

plotRGB(tc2023, r=1, g=2, b=3)
plotRGB(tc2023, r=2, g=3, b=1) # change bands

# select single bands 
plot(tc2018[[1]]) # red
plot(tc2018[[2]]) # green
plot(tc2018[[3]]) # blue
plot(fc2018[[1]]) # NIR

plot(tc2023[[1]]) # red
plot(tc2023[[2]]) # green
plot(tc2023[[3]]) # blue
plot(fc2023[[1]]) # NIR

# multiframe
c1 <- colorRampPalette(c("white", "darkblue", "black")) (100)
c2 <- colorRampPalette(c("white", "darkgreen", "black")) (100)
c3 <- colorRampPalette(c("white", "darkred", "black")) (100)
c4 <- colorRampPalette(c("white", "lightyellow", "tomato", "darkred")) (100)

par(mfrow=c(2,2)) #different bands from 2019
plot(tc2018[[1]], col = c3) # red
plot(tc2018[[2]], col = c2) # green
plot(tc2018[[3]], col = c1) # blue
plot(fc2018[[1]], col = c4) # NIR
dev.off()

par(mfrow=c(2,2)) #different bands from 2023
plot(tc2023[[1]], col = c3) # red
plot(tc2023[[2]], col = c2) # green
plot(tc2023[[3]], col = c1) # blue
plot(fc2023[[1]], col = c4) # NIR
dev.off()




# correlation between the bands
stack_sent_2018 <- c(tc2018[[1]], tc2018[[2]], tc2018[[3]], fc2018[[1]]) #2018
names(stack_sent_2018) <- c("b4_2018","b3_2018","b2_2018","b8_2018")

stack_sent_2023 <- c(tc2023[[1]], tc2023[[2]], tc2023[[3]], fc2023[[1]]) #2023
names(stack_sent_2023) <- c("b4_2023","b3_2023","b2_2023","b8_2023")

pairs(stack_sent_2018)
pairs(stack_sent_2023)
# Pearson correlation coefficient: the oblique line shows the graphical representation of the bands chosen. Under it, the correlation between the bands are portrayed: it is higher  between the visible bands, while NIR adds more information. Over the oblique line, there are the values of the correlation coefficient between the bands.




# VEGETATION INDEXES

# Difference Vegetation Index: DVI = NIR - RED
dvi2018 = fc2018[[1]] - tc2018[[1]] #2018
plot(dvi2018)

dvi2023 = fc2023[[1]] - tc2023[[1]]  #2023
plot(dvi2023)

# now changing the palette
cl <- colorRampPalette(cividis(7))(255)
cl2 <- colorRampPalette (c("oldlace", "darkslateblue", "blue4")) (100)
cl3 <- colorRampPalette (c("darkgoldenrod4", "darkslategrey","lightyellow")) (100)
plot(dvi2018, col=cl3)
plot(dvi2023, col=cl3)



# Normalized Difference Vegetation Index: NDVI = NIR - RED/ NIR + RED
ndvi2018 = (fc2018[[1]] - tc2018[[1]]) / (fc2018[[1]] + tc2018[[1]]) #2018
plot(ndvi2018)
plot(ndvi2018, col = cl3, main = "NDVI of August 2018", cex.main = .7)

ndvi2023 = (fc2023[[1]] - tc2023[[1]]) / (fc2023[[1]] + tc2023[[1]]) #2023
plot(ndvi2023)
plot(ndvi2023, col = cl3, main = "NDVI of August 2023", cex.main = .7)
dev.off()


# multiframe
par(mfrow = c (2,1))
plot(ndvi2018, col = cl3, main = "NDVI of August 2018", cex.main = .7)
plot(ndvi2023, col = cl3, main = "NDVI of August 2023", cex.main = .7)
dev.off()

# Most of the study area reflects NDVI values between 0.6 and 0.8, suggesting the presence of high or mid-high canopy cover with high vigour (https://www.agricolus.com/en/vegetation-indices-ndvi-ndmi/). As values decrease towards 0, the vegetation can both decrease in size or be more stressed. Considering the high temperatures recorded in summer 2023 (https://climate.copernicus.eu/summer-2023-hottest-record), and the vast area that is experiencing the decrease in NIR reflection, the most probable option for this phenomenon is the increase in stressed leaves. 
# Around 0 values the soil is bare, as suggested by the shape of the riverbed. Brown and so negative values are occupied by water bodies such as lakes and big rivers. In 5 years the main change consists in a little decrease in the vegetation cover or stress of 0.1 or 0.2 NDVI values.


# CLASSIFICATION OVER TIME

fc2018c <- im.classify(fc2018, num_clusters=3)

class_names <- c("absent", "stressed", "healthy")

plot(fc2018c[[1]], main = "Classes from 2018", type = "classes", levels = class_names)


fc2023c <- im.classify(fc2023, num_clusters=3)

plot(fc2023c[[1]], main = "Classes from 2023", type = "classes", levels = class_names)



par(mfrow=c(2,1))
plot(fc2018c[[1]], main = "Classes from 2018", type = "classes", levels = class_names)
plot(fc2023c[[1]], main = "Classes from 2023", type = "classes", levels = class_names)
dev.off()


# proportion of the classes
f2018 <- freq(fc2018c[[1]])
f2018
f2023 <- freq(fc2023c[[1]])
f2023

# total number of pixels
tot2018 <- ncell(fc2018c[[1]])
tot2018

tot2023<-ncell(fc2023c[[1]])
tot2023

# percentage
p2018 <- f2018 * 100 / tot2018
p2018

p2023 <- f2023 * 100 / tot2023
p2023

# In conclusion, vegetation classes had, in 2018, the following proportions: absent = 13.98185 %, stressed = 36.56682 %, healthy = 49.45133 %. In 2023, instead, the proportions were: absent = 11.54579 %, stressed = 36.10611 %, healthy = 52.34810 %.
# Classes were chosen from the environmental elements that could be recognized by the images: absent vegetation is represented by rocks and water bodies, stressed one is represented by the fields where the canopy is absent due to regular cut of the grass, while healthy vegetation is represented by the natural forest canopy.

# Final tables
# build the columns
class<- c("absent", "stressed", "healthy")
y2018<- c(14, 37, 49) 
y2023<- c(12, 36, 52) 

# assign them to the dataframe
tabout <- data.frame(class, y2018, y2023)
tabout

# Simple barplot
p1<- ggplot(tabout, aes(x=class, y=y2018, fill = class)) + 
  geom_bar(stat="identity", color = "black") + 
  ggtitle("Vegetation in 2018") + xlab("Class") + ylab("Values") +
  geom_text(aes(label=y2018), vjust=2, color="black", size=4.5) + 
  scale_fill_brewer(palette="Blues") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) 
  
p2<- ggplot(tabout, aes(x=class, y=y2023, fill = class)) + 
  geom_bar(stat="identity", color = "black") + 
  ggtitle("Vegetation in 2023") + xlab("Class") + ylab("Values") +
  geom_text(aes(label=y2023), vjust=2, color="black", size=4.5) + 
  scale_fill_brewer(palette="Blues") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) 

p1+p2

# Barplot with multiple groups
df2 <- data.frame(year=rep(c("2018", "2023"), each=3),
                  dose=c("absent", "stressed", "healthy"),2,
                  len=c(14, 37, 49, 12, 36, 52))

# Stacked barchart 
ggplot(data=df2, aes(x=dose, y=len, fill=year)) +
  geom_bar(stat="identity", color = "black")+
  geom_text(aes(label=len), vjust=0.5, color="black",
            position = position_stack(vjust =0.5), size=4.5)+
   scale_fill_brewer(palette="Paired") + 
    ggtitle("Vegetation Cover Change") + xlab("Class") + ylab("Values")+
     theme_minimal()+
      theme(plot.title = element_text(face = "bold", hjust = 0.5)) 

# In this graph we can simultaneously compare the little changes of the proportions of the classes in total amounts, like the increase of healthy vegetation passing from 2018 to 2023.

# Combined barchart
ggplot(data=df2, aes(x=dose, y=len, fill=year)) +
 geom_bar(stat="identity", color = "black", position=position_dodge())+
  geom_text(aes(label=len), vjust=1.6, color="black",
          position = position_dodge(0.9), size=4.5)+
   scale_fill_brewer(palette="Paired") + 
    ggtitle("Vegetation Cover Change") + xlab("Class") + ylab("Values")+
     theme_minimal()+
      theme(plot.title = element_text(face = "bold", hjust = 0.5)) 

# In this graph we clearly notice that there is no switch of the vegetation cover over time, and that the amounts are comparable. 

# codes from: http://www.sthda.com/english/wiki/ggplot2-barplots-quick-start-guide-r-software-and-data-visualization

dev.off()



# MOVING WINDOW APPROACH FOR DIVERSITY ASSESSMENT: focal() function

#1st case: calculating the sd in a 3x3 matrix with nir band (fc2018[[1]])
cl2 <- colorRampPalette (c("oldlace", "darkslateblue", "blue4")) (100) # recall

sd3_2018 <- focal(fc2018[[1]], matrix(1/9,3,3), fun=sd)
plot(sd3_2018)
plot(sd3_2018, col=cl2, main = "Variability of the land in August 2018", cex.main = .8) 

sd3_2023 <- focal(fc2023[[1]], matrix(1/9,3,3), fun=sd)
plot(sd3_2023)
plot(sd3_2023, col=cl2, main = "Variability of the land in August 2023", cex.main = .8) 

par(mfrow=c(2,1))
plot(sd3_2018, col=cl2, main = "Variability of the land in August 2018 (nir band)", cex.main = .8) 
plot(sd3_2023, col=cl2, main = "Variability of the land in August 2023 (nir band)", cex.main = .8) 


par(mfrow=c(2,1))
plot(sd3_2018, main = "Variability of the land in August 2018 (nir band)", cex.main = .8) 
plot(sd3_2023, main = "Variability of the land in August 2023 (nir band)", cex.main = .8) 

# the study area remained quite unchanged over time, showing an overall homogeneous aspect a part from some fields where rocks presence increase the variability of the land.

dev.off()



#2nd case: calculating the sd in a 3x3 matrix with PC1 
# MULTIVARIATE ANALYSIS (Principal Component Analysis): compacting the 3 bands of sentinel-2 into one to better visualize it

sentpc2018 <- im.pca2(fc2018)
sentpc2018 # PC1 represents 52 % of the variability
viridisc <- colorRampPalette(viridis(7))(255)

plot(sentpc2018$PC1, col = viridisc) # only the first principal component

sentpc2023 <- im.pca2(fc2023)
sentpc2023 # PCI represents 42 % of the variability

plot(sentpc2023$PC1, col = viridisc) # only the first principal component

# calculating sd of pc1 in a 3x3 matrix
pc1sd3_2018 <- focal(sentpc2018$PC1, matrix(1/9,3,3), fun=sd)
plot(pc1sd3_2018, col=cl2, main = "Variability of the land in August 2018 (PC1)", cex.main = .8)

pc1sd3_2023 <- focal(sentpc2023$PC1, matrix(1/9,3,3), fun=sd)
plot(pc1sd3_2023, col=cl2, main = "Variability of the land in August 2023 (PC1)", cex.main = .8)

# multiframe
par(mfrow=c(3,2))
im.plotRGB(fc2018, 2,1,3)
im.plotRGB(fc2023, 2,1,3)
# sd from the variability script:
plot(sd3_2018, col=cl2) 
plot(sd3_2023, col=cl2) 
plot(pc1sd3_2018, col=cl2)
plot(pc1sd3_2023, col=cl2)
dev.off()

par(mfrow=c(2,2))
plot(sd3_2018, col=cl2) 
plot(sd3_2023, col=cl2) 
plot(pc1sd3_2018, col=cl2)
plot(pc1sd3_2023, col=cl2)

# stack all the sd layers
sdstack <- c(sd3_2018, sd3_2023, pc1sd3_2018, pc1sd3_2023)
plot(sdstack, col = cl3)

# change the names
names(sdstack) <- c("NIR band from 2018", "NIR band from 2023", " PC1 from 2018", " PC1 from 2023")
plot(sdstack, col = cl2)

cl3 <- colorRampPalette (c("darkslategrey", "lightsalmon","lightyellow")) (100)

# the difference between the sd calculated from nir images and pc1 images is subtile, but a decrease in precision from PC1 method is recognizable by hte fact that the change from 2018 to 203 is increased. Anyway, both images show a decrease in land variability and higher values in the area occupied by rocks and the river.

