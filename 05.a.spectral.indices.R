library(imageRy)
library(terra)
im.list()

m1992<- im.import("matogrosso_l5_1992219_lrg.jpg") #LANDSAT image (1962)
#it's a processed image
# bands 1=NIR, 2=RED, 3=GREEN
im.plotRGB(m1992, r=1, g=2, b=3)
im.plotRGB(m1992, r=2, g=1, b=3)
im.plotRGB(m1992, r=2, g=3, b=1)

m2006<-im.import("matogrosso_ast_2006209_lrg.jpg")
m2006
im.plotRGB(m2006,r=2, g=3, b=1)

# BUILD A VEGETATION INDEX in 1992 and 2006 to see the evolution of the area

