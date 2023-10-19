#Relation among species in time
library(overlap)

data(kerinci) #data from Kerinci-Seblat National Park in Sumatra, Indonesia
kerinci
head(kerinci)
summary(kerinci)


#Selecting the first species
tiger <- kerinci[kerinci$Sps=="tiger",]

#Selecting the tigers time
tiger <- kerinci[kerinci$Sps=="tiger",] #Sps=species
kerinci$Timerad <- kerinci$Time*2*pi #we multiply the the linear time to 2 pi greek to have a time in radiants
timetig <- tiger$Timerad
densityPlot(timetig, rug=TRUE)

#Selecting the macaque
macaque <- kerinci[kerinci$Sps=="macaque",]

#Selecting the macaque time
macaque <- kerinci[kerinci$Sps=="macaque",] #Sps=species
timemac <- macaque$Timerad
densityPlot(timemac, rug=TRUE)

overlapPlot(timetig,timemac)
