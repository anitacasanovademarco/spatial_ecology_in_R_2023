# Load "readr" package to read the dataset
library(readr)

# Import the dataset into R
cc_dataset <- read.table("/Users/anita/Desktop/Unibo/Courses/1st YEAR/1st SEMESTER/Statistical Analysis and Modelling/Module 2 statistical/R_group_project/R_group_project/cc_dataset.csv", header = TRUE, sep = ",")

# See the results
# size of the dataframe
nrow(cc_dataset)
ncol(cc_dataset)

# structure of the dataframe
cc_dataset 
str(cc_dataset) 
class(cc_dataset)
View(cc_dataset)
ncol(cc_dataset)
cc.df<-cc_dataset[,-c(1,ncol(cc_dataset))]
cc.df


# Clean the data
# change the names
names(cc.df) <- c("age","education", "place", 
                    "distance", "travel", 
                    "plane","cc_belief", "antro_factors", "degree_concern", 
                    "meat", "dairy_products", "seasonal_veg", "winter_temp", "hours_heat", "prod_orig")

str(cc.df)

# 'data.frame':	144 obs. of  15 variables:
#   $ age           : chr  "22" "24" "26" "22" ... (numerical discrete)
# $ education     : chr  "Bachelor degree" "Bachelor degree" "Master degree" "Bachelor degree" ... (ordered factor)
# $ place         : chr  "City" "City" "City" "City" ... (unordered factor)
# $ distance      : chr  "1" "2" "5" "2" ... (numerical continuous)
# $ travel        : chr  "Walk" "Bike" "Bus" "Walk" ... (unordered factor)
# $ plane         : chr  "Once a year" "Once a year" "More than once a year" "Once a year" (ordered factor) ...
# $ cc_belief     : chr  "Yes" "Yes" "Yes" "Yes" ... (logical)
# $ antro_factors : chr  "Yes" "Yes" "Yes" "Yes" ... (logical)
# $ degree_concern: chr  "A lot" "A lot" "A lot" "A lot" ... (ordered factor)
# $ meat          : chr  "Once a week" "Once a month" "Never" "Once a week" ... (ordered factor)
# $ dairy_products: chr  "Once a week" "Twice a week" "Never" "Four times a week" ... (ordered factor)
# $ seasonal_veg  : chr  "20" "50" "50" "60" ... (numerical discrete)
# $ winter_temp   : chr  "20" "20" "24" "17" ... (numerical continuous)
# $ hours_heat    : chr  "5" "2" "16" "10" ... (numerical continuous)
# $ prod_orig     : chr  "Yes" "Yes" "Yes" "Yes" ... (logical)

# select a single variable or a group fo them
cc.df$dairy_products
cc.df[1:5]

cc.df[1]
# correct the variable "age"
cc.df$age <- as.numeric(cc.df$age) # wrong values are transformed into NA values
which(is.na(cc.df$age)) # position of these values
cc.df$age[c(48,127)] <- 24 # assign them to values present in previous command "cc.df[1]"
cc.df[1]
summary(cc.df$age)
mean(cc.df$age) 
var(cc.df$age)*143/144 #or mean(cc.df$age^2)-(mean(cc.df$age))^2
sqrt(var(cc.df$age)*143/144) # sd  

# The mean age = 30.625 ± 11.60632

cc.df[2]
# correct the variable "education"
cc.df$education <- factor(cc.df$education, order = TRUE, levels = c("Middle school", "High school", "Bachelor degree", "Master degree", "PhD")) 
cc.df$education
summary(cc.df$education)

perc.hs = 36 *100 /nrow(cc.df)
perc.bd = 62 *100 /nrow(cc.df)
perc.md = 40 *100 /nrow(cc.df)
perc.phd = 6 *100 /nrow(cc.df)

perc.hs + perc.bd + perc.md + perc.phd # check

# The proportions of the different levels of the "education" variable are: 0% Middle school, 25% High school, 43.05556% Bachelor degree, 27.77778% Master degree, 4.166667% PhD

cc.df[3]
# correct the variable "place"
cc.df$place <- factor(cc.df$place, levels = c("City", "Village")) 
summary(cc.df$place)
perc.city = 116 *100 /nrow(cc.df)
perc.village = 28 *100 /nrow(cc.df)

# The proportions of the different levels of the "place" variable are: 80.55556% City, 19.44444% Village

cc.df[4]
# correct the variable "distance"
cc.df$distance[7]= 7
cc.df$distance[12]= 5.7
cc.df$distance[16]= 0.5 # we assign an average value
cc.df$distance[19]= 40
cc.df$distance[23]= 5
cc.df$distance[27]= 3
cc.df$distance[29]= NA
cc.df$distance[32]= 5
cc.df$distance[35]= 0.2
cc.df$distance[37]= NA
cc.df$distance[39]= 1.5
cc.df$distance[40]= 0.2
cc.df$distance[41]= 0.6
cc.df$distance[46]= 8.7
cc.df$distance[47]= 4
cc.df$distance[48]= 31
cc.df$distance[51]= 6
cc.df$distance[55]= 2.5
cc.df$distance[58]= 5
cc.df$distance[60]= 25
cc.df$distance[62]= 3
cc.df$distance[64]= 40
cc.df$distance[65]= 82
cc.df$distance[66]= 12
cc.df$distance[67]= 16
cc.df$distance[c(68,71,75)]= 5
cc.df$distance[74]= 3
cc.df$distance[76]= 20
cc.df$distance[77]= 4
cc.df$distance[82]= 7.5
cc.df$distance[83]= 55
cc.df$distance[84]= 4
cc.df$distance[86]= 80
cc.df$distance[89]= 1
cc.df$distance[92]= 50
cc.df$distance[93]= 6.2
cc.df$distance[95]= 2
cc.df$distance[96]= 4
cc.df$distance[97]= 60
cc.df$distance[99]= 90
cc.df$distance[100]= 10
cc.df$distance[101]= 0
cc.df$distance[102]= 2
cc.df$distance[109]= NA
cc.df$distance[110]= 4
cc.df$distance[119]= 1.2
cc.df$distance[121]= 0
cc.df$distance[124]= 4
cc.df$distance[125]= 24
cc.df$distance[126]= 15
cc.df$distance[127]= 1.4
cc.df$distance[128]= 1
cc.df$distance[129]= 70
cc.df$distance[c(131,132)]= NA
cc.df$distance[134]= 2
cc.df$distance[c(136,138)]= 80
cc.df$distance[139]= 0.5
cc.df$distance[141]= 2

cc.df$distance <- as.numeric(cc.df$distance) 
summary(cc.df$distance)
mean(cc.df$distance, na.rm = T) 
var(cc.df$distance, na.rm = T)*143/144 #or mean(cc.df$distance^2)-(mean(cc.df$distance))^2
sqrt(var(cc.df$distance, na.rm = T)*143/144) # sd  

# The average distance from work / school / university is 15.36594 ± 23.98443 km

cc.df[5]
# correct the variable "education"
cc.df$education <- factor(cc.df$education, order = TRUE, levels = c("Middle school", "High school", "Bachelor degree", "Master degree", "PhD")) 
cc.df$education
summary(cc.df$education)

perc.walk = 23 *100 /nrow(cc.df)
perc.bike = 24 *100 /nrow(cc.df)
perc.bus = 20 *100 /nrow(cc.df)
perc.train = 19 *100 /nrow(cc.df)
perc.moto = 5 *100 /nrow(cc.df)
perc.car.s = 5 *100 /nrow(cc.df)
perc.car.a = 48 *100 /nrow(cc.df)

# The proportions of the different levels of the "travel" variable are: 15.97222% Walk, 16.66667% Bike, 13.88889% Bus, 13.19444% Train, 3.472222% Motorbike, 3.472222% Car (shared), 33.33333% Car (alone) 

perc.walk + perc.bike + perc.bus + perc.train + perc.moto + perc.car.s + perc.car.a

cc.df[6]
# correct the variable "plane"
cc.df$plane <- factor(cc.df$plane, order = TRUE, levels = c("Less than once a year", "Once a year", "More than once a year")) 
cc.df$plane
summary(cc.df$plane)

perc.plane.less = 65 * 100 / nrow(cc.df)
perc.plane.once = 41 * 100 / nrow(cc.df)
perc.plane.more = 38 * 100 / nrow(cc.df)

# 45.13889% of people travel by plane less than once a year, 28.47222% of them do it once a year and 26.38889% flies more than once a year.

cc.df[7]
#correct the variable "cc_belief"
cc.df$cc_belief <- ifelse(cc.df$cc_belief=="Yes", TRUE, FALSE)
summary(cc.df$cc_belief)
perc.belief = 142 * 100 / nrow(cc.df)
perc.nobelief = 2 * 100 / nrow(cc.df)

#  98.61111% of the people believe in Climate change, while 1.388889% don't

cc.df[8]
#correct the variable "antro_factors"
cc.df$antro_factors <- ifelse(cc.df$antro_factors=="Yes", TRUE, FALSE)
summary(cc.df$antro_factors)
perc.antro = 137 * 100 / nrow(cc.df)
perc.noantro = 100 - perc.antro

#  95.13889% of the people feel responsible of Climate change, while 4.861111% don't

cc.df[9]
#correct the variable "degree_concern"
cc.df$degree_concern <- factor(cc.df$degree_concern, order = TRUE, levels = c("Not at all", "In part", "A lot")) 
cc.df$degree_concern
summary(cc.df$degree_concern)
perc.not = 4 * 100 / nrow(cc.df)
perc.part = 67 * 100 / nrow(cc.df)
perc.alot = 73 * 100 / nrow(cc.df)

#  2.777778% of the people do not think they're concerned with Climate change, 46.52778% think they're partly concerned while 50.69444% of them think they're much concerned with it

cc.df[10]
#correct the variable "meat"
cc.df$meat <- factor(cc.df$meat, order = TRUE, levels = c("Never", "Once a month", "Once a week", "Twice a week", "Four times a week", "Every day")) 
cc.df$meat
summary(cc.df$meat)

cc.df[11]
#correct the variable "dairy_products"
cc.df$dairy_products <- factor(cc.df$dairy_products, order = TRUE, levels = c("Never", "Once a month", "Once a week", "Twice a week", "Four times a week", "Every day")) 
cc.df$dairy_products
summary(cc.df$dairy_products)

cc.df[12]
#correct the variable "seasonal_veg"
cc.df$seasonal_veg[cc.df$seasonal_veg == "10%"] = 10
cc.df$seasonal_veg[cc.df$seasonal_veg == "30%"] = 30
cc.df$seasonal_veg[cc.df$seasonal_veg == "40%"] = 40
cc.df$seasonal_veg[cc.df$seasonal_veg == "50%"] = 50
cc.df$seasonal_veg[cc.df$seasonal_veg == "60%"] = 60
cc.df$seasonal_veg[cc.df$seasonal_veg == "75%"] = 75
cc.df$seasonal_veg[cc.df$seasonal_veg == "80%"] = 80
cc.df$seasonal_veg[cc.df$seasonal_veg == "90%"] = 90
cc.df$seasonal_veg[cc.df$seasonal_veg == "95%"] = 95
cc.df$seasonal_veg[cc.df$seasonal_veg == "98%"] = 98
cc.df$seasonal_veg[cc.df$seasonal_veg == "99%"] = 99
cc.df$seasonal_veg[cc.df$seasonal_veg == "100%"] = 100
cc.df$seasonal_veg[88] = 50

cc.df$seasonal_veg <- as.numeric(cc.df$seasonal_veg)
cc.df$seasonal_veg
mean(cc.df$seasonal_veg, na.rm=T)
var(cc.df$seasonal_veg, na.rm=T)*143/144
sqrt(var(cc.df$seasonal_veg, na.rm=T)*143/144) #sd

# People from the survey use to eat, on average, the 63.50704 ± 24.43183% of seasonal fruit and vegetables

cc.df[13]
#correct the variable "winter_temp"
cc.df$winter_temp[cc.df$winter_temp == "18°C"] = 18
cc.df$winter_temp[cc.df$winter_temp == "19°"] = 19
cc.df$winter_temp[cc.df$winter_temp == "19°C"] = 19
cc.df$winter_temp[cc.df$winter_temp == "19 °C"] = 19
cc.df$winter_temp[cc.df$winter_temp == "20°"] = 20
cc.df$winter_temp[cc.df$winter_temp == "20°C"] = 20
cc.df$winter_temp[cc.df$winter_temp == "20 C"] = 20
cc.df$winter_temp[cc.df$winter_temp == "20 C "] = 20

cc.df$winter_temp[c(11,51)] = 18.5
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

cc.df$winter_temp <- as.numeric(cc.df$winter_temp)
summary(cc.df$winter_temp)


# Create a new file with updated values
write.table(x = cc.df, file = "cc_data_clean.csv")

summary(cc.df)

##QUESTIONS:
#How many students per country?
#table counts the frequency of variables
table(stud.df$country)
table(stud.df$country)/nrow(stud.df)
round(table(stud.df$country)/nrow(stud.df),3)*100


#Most common way to come to class?
table(stud.df$travel)

#What is the mean distance travelled by those coming by foot? And by train?
mean(stud.df$km_travel[stud.df$travel=="walk"])
mean(stud.df$km_travel[stud.df$travel=="train"])

#Mean distance for ways of travelling
aggregate(x=stud.df$km_travel, by=list(WayOfTravelling=stud.df$travel),FUN=mean)


# Remove missing values
mean(age, na.rm = T) 

# Check for missing values
is.na(age)

# Add or remove missing values
age[is.na(age)] <- 23 #or
age <- c(25, 31, NA, 41) age[is.na(age)==F]

vec.dairy <- c("High", "Low", "High","Low", "Medium")
fct.dairy <- factor(vec.dairy, order = TRUE, levels = c("Low", "Medium", "High")) 
fct.dairy
summary(fct.dairy)
