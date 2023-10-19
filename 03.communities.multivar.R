#In communities, species are overlapping in space and time
#First exercise: multibvariate analisys-how species are related in space
#Second exercise-how species are related in time

#Vegetation Analisys
library(vegan)
data(dune) 
dune #to see the dataset
#or
head(dune) #just the first 6 rows
tail(dune) #just the last 6 rows
#we see a matrix of amout of individuals in every plot

ord<-decorana(dune) #let's use the function decorana from the package vegan: it means detrended occurrence analysis
#we have to know the length of the new axes

ldc1 = 3.7004 #length decorana 1
ldc2 = 3.1166 
ldc3 = 1.30055 
ldc4 = 1.47888
total = ldc1 + ldc2 + ldc3 + ldc4

pldc1 = ldc1 * 100/total #percentage of every axes
pldc2 = ldc2 * 100/total
pldc3 = ldc3 * 100/total
pldc4 = ldc4 * 100/total

pldc1
pldc2
pldc3
pldc4

#as pldc1 + pldc2 represent the 70% of the total, we can only keep them

plot(ord) 
# names represent species (we see coupling species), numbers represent plots: everything is depicted in a new dimention made by dca1 and 2
#from the table we can understand the environments

