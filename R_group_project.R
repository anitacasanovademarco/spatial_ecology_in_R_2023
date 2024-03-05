# Title

#### DATA CLEANING and brief data description: Casanova De Marco A.
# Load "readr" package to read the data set
library(readr)

# Import the data set into R
cc_dataset <- read.table("/Users/anita/Desktop/Unibo/Courses/1st YEAR/1st SEMESTER/Statistical Analysis and Modelling/Module 2 statistical/R_group_project/R_group_project/cc_dataset.csv", header = TRUE, sep = ",")

# Visualize the results
#1 size of the data frame
nrow(cc_dataset) # there are 144 statistical units
ncol(cc_dataset) # we are not interested into the first and last column
cc.df<-cc_dataset[,-c(1,ncol(cc_dataset))]
ncol(cc.df) # now there are 15 columns = 15 variables chosen

#2 structure of the data frame
cc.df
str(cc.df) 
class(cc.df) # cc.df is a data frame
View(cc.df)


# Clean the data
#1 change the names of the variables into shorter one to better handle them
names(cc.df) <- c("age","education", "place", 
                  "distance", "travel", 
                  "plane","cc_belief", "anthro_factors", "degree_concern", 
                  "meat", "dairy_products", "seasonal_veg", "winter_temp", "hours_heat", "prod_orig")

str(cc.df)

# 'data.frame':	144 obs. of  15 variables
# $ age           : chr  "22" "24" "26" "22" ... (numerical discrete)
# $ education     : chr  "Bachelor degree" "Bachelor degree" "Master degree" "Bachelor degree" ... (ordered factor)
# $ place         : chr  "City" "City" "City" "City" ... (unordered factor)
# $ distance      : chr  "1" "2" "5" "2" ... (numerical continuous)
# $ travel        : chr  "Walk" "Bike" "Bus" "Walk" ... (unordered factor)
# $ plane         : chr  "Once a year" "Once a year" "More than once a year" "Once a year" ... (ordered factor) 
# $ cc_belief     : chr  "Yes" "Yes" "Yes" "Yes" ... (logical)
# $ anthro_factors : chr  "Yes" "Yes" "Yes" "Yes" ... (logical)
# $ degree_concern: chr  "A lot" "A lot" "A lot" "A lot" ... (ordered factor)
# $ meat          : chr  "Once a week" "Once a month" "Never" "Once a week" ... (ordered factor)
# $ dairy_products: chr  "Once a week" "Twice a week" "Never" "Four times a week" ... (ordered factor)
# $ seasonal_veg  : chr  "20" "50" "50" "60" ... (numerical discrete)
# $ winter_temp   : chr  "20" "20" "24" "17" ... (numerical continuous)
# $ hours_heat    : chr  "5" "2" "16" "10" ... (numerical continuous)
# $ prod_orig     : chr  "Yes" "Yes" "Yes" "Yes" ... (logical)

#2 select a single variable or a group of them to correct them
#2.1 correct the variable "age"
cc.df$age 
as.numeric(cc.df$age) # convert observations into numbers: wrong values are transformed into NA 
which(is.na(cc.df$age)) # position of these values 
cc.df$age[48] # 24 anni
cc.df$age[127] # 24 years old
cc.df$age[c(48,127)] <- 24 # assign these categorical values to numerical values so that R can read them as numbers
cc.df$age <- as.numeric(cc.df$age) # now we can do the assignment

summary(cc.df$age)
mean(cc.df$age) 
var(cc.df$age)* 143 / 144 # or mean(cc.df$age^2)-(mean(cc.df$age))^2
sqrt(var(cc.df$age) * 143 / 144) # sd  

# The mean age of the sample is 30.625 ± 11.60632

cc.df[2]
#2.2 correct the variable "education"
factor(cc.df$education, order = TRUE, levels = c("Middle school", "High school", "Bachelor degree", "Master degree", "PhD")) # no NA values, we can do the assignment
cc.df$education <- factor(cc.df$education, order = TRUE, levels = c("Middle school", "High school", "Bachelor degree", "Master degree", "PhD")) 

summary(cc.df$education)
perc.hs = 36 * 100 / nrow(cc.df)
perc.bd = 62 * 100 / nrow(cc.df)
perc.md = 40 * 100 /nrow(cc.df)
perc.phd = 6 * 100 / nrow(cc.df)

perc.hs + perc.bd + perc.md + perc.phd # check

perc.hs
perc.bd
perc.md
perc.phd

# easier method
round(table(cc.df$education)/nrow(cc.df),2) * 100 # table with all percentages rounded to the first two digits

# The proportions of the different levels of the "education" variable are: 0 % Middle school, 25 % High school, 43 % Bachelor degree, 27 % Master degree, 4 % PhD

cc.df[3]
#2.3 correct the variable "place"
factor(cc.df$place, levels = c("City", "Village")) # no NA values, we can do the assignment
cc.df$place <- factor(cc.df$place, levels = c("City", "Village")) 

summary(cc.df$place)
round(table(cc.df$place)/nrow(cc.df),2) * 100 # table with all percentages rounded to the first two digits

# The proportions of the different levels of the "place" variable are: 81 % City, 19 % Village

cc.df[4]
#2.4 correct the variable "distance"
as.numeric(cc.df$distance) # convert observations into numbers: wrong values are transformed into NA 
which(is.na(cc.df$distance)) # position of these values 

cc.df$distance[7]= 7 # first write all new assignments singularly and then make grouped assignments with similar values to save space
cc.df$distance[12]= 5.7
cc.df$distance[c(16,139)]= 0.5 # an average value was chosen as no specific value was mentioned in the observation
cc.df$distance[c(19,64)]= 40
cc.df$distance[c(23,32,58,68,71,75)]= 5
cc.df$distance[c(29,37,109,131,132)]= NA # observations that couldn't be associated to any specific value
cc.df$distance[35]= 0.2
cc.df$distance[39]= 1.5
cc.df$distance[40]= 0.2
cc.df$distance[41]= 0.6
cc.df$distance[46]= 8.7
cc.df$distance[c(47,77,84,96,110,124)]= 4
cc.df$distance[48]= 31
cc.df$distance[51]= 6
cc.df$distance[55]= 2.5
cc.df$distance[60]= 25
cc.df$distance[c(27,62,74)]= 3
cc.df$distance[65]= 82
cc.df$distance[66]= 12
cc.df$distance[67]= 16
cc.df$distance[76]= 20
cc.df$distance[82]= 7.5
cc.df$distance[83]= 55
cc.df$distance[c(89,128)]= 1
cc.df$distance[92]= 50
cc.df$distance[93]= 6.2
cc.df$distance[97]= 60
cc.df$distance[99]= 90
cc.df$distance[100]= 10
cc.df$distance[c(101,121)]= 0
cc.df$distance[119]= 1.2
cc.df$distance[120]= 18 
cc.df$distance[125]= 24
cc.df$distance[126]= 15
cc.df$distance[127]= 1.4
cc.df$distance[129]= 70
cc.df$distance[c(95,102,134,141)]= 2
cc.df$distance[c(86,136,138)]= 80

as.numeric(cc.df$distance)  # check
cc.df$distance <- as.numeric(cc.df$distance) # now we can do the assignment

summary(cc.df$distance)
mean(cc.df$distance, na.rm = T) 
var(cc.df$distance, na.rm = T) * 138 / 139 #or mean(cc.df$distance^2, na.rm = T) - (mean(cc.df$distance, na.rm = T))^2
sqrt(var(cc.df$distance, na.rm = T) * 138 / 139) # sd  

# The average distance from work / school / university is 15.38489 ± 23.8954 km

cc.df[5]
#2.5 correct the variable "travel"
factor(cc.df$travel, order = F, levels = c("Walk","Bike","Bus","Train","Motorbike","Car (shared)","Car (alone)")) # no NA values, we can do the assignment
cc.df$travel <- factor(cc.df$travel, order = F, levels = c("Walk","Bike","Bus","Train","Motorbike","Car (shared)","Car (alone)")) 

summary(cc.df$travel)
round(table(cc.df$travel)/nrow(cc.df),2) * 100 # table with all percentages rounded to the first two digits
aggregate(x = cc.df$distance, by = list(WayOfTravelling=cc.df$travel),FUN = mean, na.rm = T)

# The proportions of the different levels of the "travel" variable are: 16 % Walk, 17 % Bike, 14 % Bus, 13 % Train, 3 % Motorbike, 3 % Car (shared), 33 % Car (alone). To travel greater distances, people from the survey usually choose, on average, trains as first option, car shared as second option and car alone as third option. Closest people from work / school/ university usually move on foot.


cc.df[6]
#2.6 correct the variable "plane"
factor(cc.df$plane, order = TRUE, levels = c("Less than once a year", "Once a year", "More than once a year")) # no NA values, we can do the assignment
cc.df$plane <- factor(cc.df$plane, order = TRUE, levels = c("Less than once a year", "Once a year", "More than once a year")) 

summary(cc.df$plane)
round(table(cc.df$plane)/nrow(cc.df),2) * 100 # table with all percentages rounded to the first two digits

# 45 % of people travel by plane less than once a year, 28 % of them do it once a year and 26 % flies more than once a year.

cc.df[7]
#2.7 correct the variable "cc_belief"
ifelse(cc.df$cc_belief=="Yes", TRUE, FALSE) # no NA values, we can do the assignment
cc.df$cc_belief <- ifelse(cc.df$cc_belief=="Yes", TRUE, FALSE)

summary(cc.df$cc_belief)
round(table(cc.df$cc_belief)/nrow(cc.df),4) * 100 # table with all percentages rounded to the first four digits
#  98.61 % of the people believe in Climate change, while 1.39 % don't

cc.df[8]
#2.8 correct the variable "anthro_factors"
ifelse(cc.df$anthro_factors=="Yes", TRUE, FALSE) # no NA values, we can do the assignment
cc.df$anthro_factors <- ifelse(cc.df$anthro_factors=="Yes", TRUE, FALSE)

summary(cc.df$anthro_factors)
round(table(cc.df$anthro_factors)/nrow(cc.df),4) * 100 # table with all percentages rounded to the first four digits

#  95.14 % of the people feel responsible of Climate change, while 4.86 % don't

cc.df[9]
#2.9 correct the variable "degree_concern"
factor(cc.df$degree_concern, order = TRUE, levels = c("Not at all", "In part", "A lot")) # no NA values, we can do the assignment
cc.df$degree_concern <- factor(cc.df$degree_concern, order = TRUE, levels = c("Not at all", "In part", "A lot")) 

summary(cc.df$degree_concern)
round(table(cc.df$degree_concern)/nrow(cc.df),2) * 100 # table with all percentages rounded to the first two digits

#  3 % of the people do not think they're concerned with Climate change, 47 % think they're partly concerned while 51 % of them think they're much concerned with it

cc.df[10]
#2.10 correct the variable "meat"
factor(cc.df$meat, order = TRUE, levels = c("Never", "Once a month", "Once a week", "Twice a week", "Four times a week", "Every day")) # no NA values, we can do the assignment
cc.df$meat <- factor(cc.df$meat, order = TRUE, levels = c("Never", "Once a month", "Once a week", "Twice a week", "Four times a week", "Every day")) 

summary(cc.df$meat)
round(table(cc.df$meat)/nrow(cc.df),2) * 100 # table with all percentages rounded to the first two digits

# 10 % of people from the survey never eats meat, 11 % does it once a month, 24 % once a week, 33 % twice a week, 18 % four times a week and 4 % everyday

cc.df[11]
#2.11 correct the variable "dairy_products"
factor(cc.df$dairy_products, order = TRUE, levels = c("Never", "Once a month", "Once a week", "Twice a week", "Four times a week", "Every day")) # no NA values, we can do the assingment
cc.df$dairy_products <- factor(cc.df$dairy_products, order = TRUE, levels = c("Never", "Once a month", "Once a week", "Twice a week", "Four times a week", "Every day")) 

summary(cc.df$dairy_products)
round(table(cc.df$dairy_products)/nrow(cc.df),2) * 100 # table with all percentages rounded to the first two digits

# 1 % of people from the survey never eats meat, 6 % does it once a month, 18 % once a week, 33 % twice a week, 19 % four times a week and 22 % everyday

cc.df[12]
#2.12 correct the variable "seasonal_veg"
as.numeric(cc.df$seasonal_veg) # convert observations into numbers: wrong values are transformed into NA 
which(is.na(cc.df$seasonal_veg)) # position of these values 

cc.df$seasonal_veg[cc.df$seasonal_veg == "10%"] = 10
cc.df$seasonal_veg[cc.df$seasonal_veg == "30%"] = 30
cc.df$seasonal_veg[cc.df$seasonal_veg == "40%"] = 40
cc.df$seasonal_veg[cc.df$seasonal_veg == "50%"] = 50
cc.df$seasonal_veg[cc.df$seasonal_veg == "60%"] = 60
cc.df$seasonal_veg[cc.df$seasonal_veg == "70%"] = 70
cc.df$seasonal_veg[cc.df$seasonal_veg == "75%"] = 75
cc.df$seasonal_veg[cc.df$seasonal_veg == "80%"] = 80
cc.df$seasonal_veg[cc.df$seasonal_veg == "90%"] = 90
cc.df$seasonal_veg[cc.df$seasonal_veg == "90% "] = 90
cc.df$seasonal_veg[cc.df$seasonal_veg == "95%"] = 95
cc.df$seasonal_veg[cc.df$seasonal_veg == "98%"] = 98
cc.df$seasonal_veg[cc.df$seasonal_veg == "99%"] = 99
cc.df$seasonal_veg[cc.df$seasonal_veg == "100%"] = 100
cc.df$seasonal_veg[88] = 50

as.numeric(cc.df$seasonal_veg) # check
cc.df$seasonal_veg <- as.numeric(cc.df$seasonal_veg) # now we can do the assignment
summary(cc.df$seasonal_veg)
cc.df$seasonal_veg
mean(cc.df$seasonal_veg, na.rm=T)
var(cc.df$seasonal_veg, na.rm=T) * 141 / 142 # 2 NA values removed from the total statistical units
sqrt(var(cc.df$seasonal_veg, na.rm=T) * 141 / 142) #sd

# People from the survey use to eat, on average, 63.50704 ± 24.43063 % of seasonal fruit and vegetables

cc.df[13]
#2.13 correct the variable "winter_temp"
as.numeric(cc.df$winter_temp) # convert observations into numbers: wrong values are transformed into NA 
which(is.na(cc.df$winter_temp)) # position of these values 

cc.df$winter_temp[cc.df$winter_temp == "18°C"] = 18
cc.df$winter_temp[cc.df$winter_temp == "19°"] = 19
cc.df$winter_temp[cc.df$winter_temp == "19°C"] = 19
cc.df$winter_temp[cc.df$winter_temp == "19 °C"] = 19
cc.df$winter_temp[cc.df$winter_temp == "19 "] = 19
cc.df$winter_temp[cc.df$winter_temp == "20°"] = 20
cc.df$winter_temp[cc.df$winter_temp == "20°C"] = 20
cc.df$winter_temp[cc.df$winter_temp == "20 C"] = 20
cc.df$winter_temp[cc.df$winter_temp == "20 C "] = 20
cc.df$winter_temp[c(11,51,90)] = 18.5
cc.df$winter_temp[c(26,88,93)] = 20.5
cc.df$winter_temp[c(35,64,65,76,78,95,107,119)] = 19.5
cc.df$winter_temp[50] = 21.5
cc.df$winter_temp[84] = 18.75
cc.df$winter_temp[96] = 21
cc.df$winter_temp[99] = 18.8
cc.df$winter_temp[124] = 20.5
cc.df$winter_temp[125] = 17.5
cc.df$winter_temp[127] = 22.5
cc.df$winter_temp[136] = 19
cc.df$winter_temp[141] = 22

cc.df[13] # check
cc.df$winter_temp <- as.numeric(cc.df$winter_temp) # now we can do the assingment
summary(cc.df$winter_temp)
mean(cc.df$winter_temp, na.rm = T)
var(cc.df$winter_temp, na.rm = T) * 142 / 143 # 1 NA value
sqrt(var(cc.df$winter_temp, na.rm = T) * 142 / 143)

# The average winter temperature in the sample is 19.47587 ± 1.87637 °C 

cc.df[14]
#2.14 correct the variable "hours_heat"
as.numeric(cc.df$hours_heat) # convert observations into numbers: wrong values are transformed into NA 
which(is.na(cc.df$hours_heat)) # position of these values 

cc.df$hours_heat[c(7,100)] = 5
cc.df$hours_heat[9] = 12.5
cc.df$hours_heat[c(19,70,124)] = 2.5
cc.df$hours_heat[c(25,51)] = 5.5
cc.df$hours_heat[c(38,39,58,65,79,82,93,95,112,113,125,127,129,136)] = NA
cc.df$hours_heat[c(22,43,67)] = 24
cc.df$hours_heat[47] = 12
cc.df$hours_heat[c(46,48,92,143)] = 8
cc.df$hours_heat[50] = 8.5
cc.df$hours_heat[c(73,108)] = 3.5
cc.df$hours_heat[c(75,117,139,141)] = 3
cc.df$hours_heat[c(76,119)] = 4.5
cc.df$hours_heat[c(78,128)] = 2
cc.df$hours_heat[c(84,85)] = 6.5
cc.df$hours_heat[96] = 17
cc.df$hours_heat[101] = 9
cc.df$hours_heat[126] = 1
cc.df$hours_heat[140] = 10


cc.df[14] # check
cc.df$hours_heat <- as.numeric(cc.df$hours_heat) # now we can do the assignment
summary(cc.df$hours_heat)

mean(cc.df$hours_heat, na.rm = T)
var(cc.df$hours_heat, na.rm = T) * 129 / 130 # 14 NA removed
sqrt(var(cc.df$hours_heat, na.rm = T) * 129 / 130)

# On average, the sample population keeps the heating on for 7.757692 ±  6.041916 hours per day

cc.df[15]
#2.15 correct the variable "prod_orig"
ifelse(cc.df$prod_orig=="Yes", TRUE, FALSE) # no NA values, we can do the assignment
cc.df$prod_orig <- ifelse(cc.df$prod_orig=="Yes", TRUE, FALSE)

summary(cc.df$prod_orig)
round(table(cc.df$prod_orig)/nrow(cc.df),4) * 100 # table with all percentages rounded to the first four digits

# 82.64 % of the sample population cares about the origin of the products they buy, while 17.36 % of them doesn't

# Create a new file with updated cleaned values
write.table(x = cc.df, file = "cc_data_clean.csv")

summary(cc.df)
str(cc.df)

# Create a new variable formed by grouped data
range(cc.df$distance, na.rm = T) 

cut(cc.df$distance, 
    breaks = c(0, 2, 8, 20,50, 100), 
    order = T,
    labels = c("very close", "close","medium", "far", "very far"), 
    na.rm = T)

dist_cat <- cut(cc.df$distance, 
                breaks = c(0, 2, 8, 20,50, 100), 
                order = T,
                labels = c("very close", "close","medium", "far", "very far"), 
                na.rm = T)
table(dist_cat)
str(dist_cat)

ifelse(dist_cat=="very close", "(0-2]", 
       ifelse(dist_cat=="close",  "(2-8]", 
              ifelse(dist_cat=="medium", "(8-20]",
                     ifelse(dist_cat=="far", "(20-50]", 
                            ifelse(dist_cat=="very far",  "(50-100]", NA)))))
# we associate each test ("close", "very close") to their length
# NA in the end is needed to say that the values are finished
dist_cat_num <- ifelse(dist_cat=="very close", "(0-2]", 
                       ifelse(dist_cat=="close",  "(2-8]", 
                              ifelse(dist_cat=="medium", "(8-20]",
                                     ifelse(dist_cat=="far", "(20-50]", 
                                            ifelse(dist_cat=="very far",  "(50-100]", NA)))))
table(dist_cat_num)
str(dist_cat_num)

factor(dist_cat_num, order = T, levels = c("(0-2]","(2-8]","(8-20]","(20-50]","(50-100]"))
dist_cat_num <- factor(dist_cat_num, order = T, levels = c("(0-2]","(2-8]","(8-20]","(20-50]","(50-100]"))
summary(dist_cat_num)

# add this variable to the data set
cc.df <- data.frame(cc.df, dist_cat, dist_cat_num)
str(cc.df)
head(cc.df)

# Create a second variable
ifelse((cc.df$meat=="Once a month" | cc.df$meat=="Once a week" |
          cc.df$meat=="Twice a week" | cc.df$meat=="Four times a week" | cc.df$meat=="Every day"), T, F)
cc.df$omnivorous <- ifelse((cc.df$meat=="Once a month" | cc.df$meat=="Once a week" |
                              cc.df$meat=="Twice a week" | cc.df$meat=="Four times a week" | cc.df$meat=="Every day"), T, F)

ifelse((cc.df$meat=="Never" & (cc.df$dairy_products=="Once a month" | cc.df$dairy_products=="Once a week" | cc.df$dairy_products=="Twice a week" | cc.df$dairy_products=="Four times a week" | cc.df$dairy_products=="Every day" )), T, F)
cc.df$vegetarian <- ifelse((cc.df$meat=="Never" & (cc.df$dairy_products=="Once a month" | cc.df$dairy_products=="Once a week" | cc.df$dairy_products=="Twice a week" | cc.df$dairy_products=="Four times a week" | cc.df$dairy_products=="Every day" )), T, F)

ifelse((cc.df$meat=="Never" & cc.df$dairy_products=="Never" ), T, F)
cc.df$vegan <- ifelse((cc.df$meat=="Never" & cc.df$dairy_products=="Never" ), T, F)

# diet variable
ifelse((cc.df$meat=="Once a month" | cc.df$meat=="Once a week" |
          cc.df$meat=="Twice a week" | cc.df$meat=="Four times a week" | cc.df$meat=="Every day"), "Omnivorous",
       ifelse((cc.df$meat=="Never" & (cc.df$dairy_products=="Once a month" | cc.df$dairy_products=="Once a week" | cc.df$dairy_products=="Twice a week" | cc.df$dairy_products=="Four times a week" | cc.df$dairy_products=="Every day" )), "Vegetarian", 
              ifelse((cc.df$meat=="Never" & cc.df$dairy_products=="Never"), "Vegan", NA)))
cc.df$diet <- ifelse((cc.df$meat=="Once a month" | cc.df$meat=="Once a week" |
                        cc.df$meat=="Twice a week" | cc.df$meat=="Four times a week" | cc.df$meat=="Every day"), "Omnivorous",
                     ifelse((cc.df$meat=="Never" & (cc.df$dairy_products=="Once a month" | cc.df$dairy_products=="Once a week" | cc.df$dairy_products=="Twice a week" | cc.df$dairy_products=="Four times a week" | cc.df$dairy_products=="Every day" )), "Vegetarian", 
                            ifelse((cc.df$meat=="Never" & cc.df$dairy_products=="Never"), "Vegan", NA)))
cc.df <- data.frame(cc.df, cc.df$diet)

table(cc.df$dairy_products, cc.df$diet)
table(cc.df$meat, cc.df$diet)

# Create a new file with updated values
write.table(x = cc.df, file = "cc_data_new.csv")



#### DESCRIPTIVE ANALYSIS & INFERENTIAL ANALYSIS
# Bar chart:
barplot(table(cc.df$dist_cat))
barplot(table(cc.df$travel))

# change colors of all columns
barplot(table(cc.df$travel), col="pink3" )
?barplot

# change color of the single columns
library(RColorBrewer) # allows to create palettes 
coul <- brewer.pal(5, "Set3")

barplot(table(cc.df$travel), col=c(1,2,3,4,5))
barplot(table(cc.df$travel), col=coul)

# change border color
barplot(table(cc.df$travel), border="#69b3a2", col="white")

# axis label
barplot(table(cc.df$travel), xlab="Categories",
        ylab="Values",  main="Ways of travelling", ylim=c(0,50), col = coul)

# horizontal barplot
barplot(table(cc.df$travel), col="#69b3a2",  horiz=T)

barplot(table(cc.df$travel), 
        col="#69b3a2",  
        horiz=T, las=1)   #las 1 = axis labels always horizontal
         

# change the names
barplot(table(cc.df$travel), 
        names.arg = c("group1","group2","group3","group4", "group5", "group6","group7"), 
        col = "orange")


# customize labels (left)
barplot(table(cc.df$travel),
        names.arg=c("group1","group2","group3","group4", "group5", "group6","group7"),
        font.axis=2,
        col.axis="orange",
        cex.axis=1.5)

# customize title (right)
barplot(table(cc.df$travel),
        xlab="Category", ylab="Values",
        font.lab=2,
        col.lab="blue",
        cex.lab=2, main = "Way of travelling", cex.main=2)


barplot(table(cc.df$travel), 
        xlab="Categories",
        ylab="Values",  
        main="Ways of travelling", 
        ylim=c(0,50), 
        col = coul, font.lab = 3, cex.lab = 1.5,
        cex.main = 2)





# Pie chart 
pie(table(cc.df$travel), main="Pie chart of Travel", cex.main = 2)
dev.off()






# Histogram
hist(cc.df$age,  
     xlab="Age",
     ylab="Frequency",  
     main="Histogram of age", 
     xlim = c(20,70),
     ylim=c(0,80), 
     col = coul, font.lab = 3, cex.lab = 1.3,
     cex.main = 2)


# relative frequency density 
hist(cc.df$age, freq = F)

#In this case we could need

s <- c(20, 24, 35, 45, 70)
hist(cc.df$age, breaks=s, xlim=c(20,70), right=F, col='lavenderblush',
     xlab="Age", main='Histogram fo age', freq=F) # right = F (default) the right value of breaks is not included




# Create a list
a <- hist(cc.df$age, breaks=s, xlim=c(20,70), right=F, col='lavenderblush',
          xlab="Age", main='Histogram fo age', freq=F)

str(a) # we can access to the elements of the list like in dataframes
a$mids

# plot the elements of the list
plot('', xlim=c(20,70), ylim=c(0,.1))
abline(h=0.005, col="gray", lty=3, lwd=1.5) #lty = line type, lwd = line width
abline(h=0.01, col="gray", lty=3, lwd=2.5)
abline(h=0.05, col="gray", lty=3, lwd=3.5)
plot(a, add=T)
text(a$mids,a$density,labels=round(a$density,2), adj=c(0.5, -0.5))

# mean & variance
mean(cc.df$age)
mean(cc.df$age^2)-mean(cc.df$age)^2

median(cc.df$age)
quantile(cc.df$age)

quantile(cc.df$age, p=0.4)

# boxplot
boxplot(cc.df$age)

# covariance
mean(cc.df$age*cc.df$prod_orig)-mean(cc.df$age)*mean(cc.df$prod_orig)
cov(cc.df$age,cc.df$prod_orig)
cor(cc.df$age,cc.df$prod_orig)


plot(cc.df$age, cc.df$prod_orig)

####
####
###Scatterplot
data(trees)
tdf <- trees

cor(tdf$Height, tdf$Volume)
cor(tdf$Height, tdf$Girth)


plot(tdf$Height, tdf$Volume)
plot(tdf$Height, tdf$Volume, xlab = "height", ylab="volume")
plot(tdf$Height, tdf$Volume, xlab = "height", ylab="volume", main="Tree", col="red")


plot(tdf$Height, tdf$Volume, xlab = "height", ylab="volume", main="Tree", col="red", xaxt='n', yaxt='n')
axis(1, tick=T, at = c(60,70,80))
axis(2, tick=T, at = c(20,40, 60, 80), font=2)













