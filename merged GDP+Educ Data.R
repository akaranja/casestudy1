#Merging the data
GDP_Educ<- merge (FGDPData, EducationData.final, by="CountryCode", all=TRUE)
library(reshape2)
library(dplyr)
library(ggplot2)
GDP_Educ
View(GDP_Educ)
# how many missing values per column
colSums(is.na(GDP_Educ))
str(GDP_Educ)

#convert GDP column fron factor to numeric column
GDP_Educ$GDP <- as.numeric(gsub("[^[:digit:]]","", GDP_Educ$GDP))
View(GDP_Educ)



#remove any rows with NAs/missing values in GDP grom the GDP data
#and Long.name column from the Education Data.
# Ensures that the remaining rows have data from both datasets. 
GDP_Educ.clean <- GDP_Educ[!is.na(GDP_Educ$GDP),]
View(GDP_Educ.clean)
nrow(GDP_Educ.clean)

GDP_Educ.clean1 <- GDP_Educ.clean[!is.na(GDP_Educ.clean$Long.Name),]
View(GDP_Educ.clean1)
nrow(GDP_Educ.clean1)

# How many Ids match
GDP_Educ <- GDP_Educ[!is.na(GDP_Educ$CountryCode),]
View(GDP_Educ)
nrow(GDP_Educ)


#sort the data frame in ascending order
GDP_Educ.sort <-GDP_Educ.clean1[order(GDP_Educ.clean1$GDP) , ]
View(GDP_Educ.sort)
GDP_Educ.sort[1:15, ]

#the 13th country from sorted dataframe
GDP_Educ.sort [13,5]


#average GDPrankings for "High Income:OECD
mean()
unique(GDP_Educ.sort$)
