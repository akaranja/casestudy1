#Merging the data
GDP_Educ<- merge (FGDPData, EducationData.final, by="CountryCode", all=TRUE)
library(reshape2)
library(dplyr)
library(ggplot2)
library(plyr)
library(data.table)
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

# how many missing values per column
colSums(is.na(GDP_Educ))


#sort the data frame in ascending order
GDP_Educ.sort <-GDP_Educ.clean1[order(GDP_Educ.clean1$GDP) , ]
View(GDP_Educ.sort)
GDP_Educ.sort[1:15, ]

#the 13th country from sorted dataframe
GDP_Educ.sort [13,5]


#average GDPrankings for "High Income:nonOECD group
nonOECD<- subset(GDP_Educ.sort, Income.Group =='High income: nonOECD')
View(nonOECD)
mean(nonOECD$GDP, na.rm=TRUE)


#average GDPrankings for "High Income:OECD group
OECD<- subset(GDP_Educ.sort, Income.Group =='High income: OECD')
View(OECD)
mean(OECD$GDP, na.rm = TRUE)

#Summary satatistics of GDP by Income Groups
## How many income groups? =6
str(GDP_Educ.sort$Income.Group)
#Summary = (Min, 1st quartile, Median, Mean,3rd Quartile and Max)
# listed per IncomeGroup
GDP_Educ.final<- data.table(GDP_Educ.sort)
setkey(GDP_Educ.final, Income.Group)
aggre_GDP_Educ <- as.data.frame(GDP_Educ.final[,summary(GDP, na.rm= T), by= Income.Group])
aggre_GDP_Educ

# how many missing values per column
colSums(is.na(GDP_Educ.final))


#Cut GDP ranking into 5 Quartile Groups
GDP_Educ.final$quartile <- ntile(GDP_Educ.final$GDP, 5)  
str(GDP_Educ.final)

#Table of GDP Ranking vs Income Group
GDP_Educ.table <- with(GDP_Educ.final, table(quartile, Income.Group))
View(GDP_Educ.table)

# how many missing values per column
colSums(is.na(GDP_Educ.table))

#How many countries are Lower Middle Income but among the 38 nations with highest GDP
#Sort by Quartile in Descending order
#list all Rows with Quartile =5
GDP_Educ.table[5, ]
## Lower Middle Income = 4 Countries.


#GDP_Educ.table1 <- with(GDP_Educ.sort, table(CountryCode, GDP))
#View(GDP_Educ.table1)

#ggplot(GDP_Educ.sort, aes(x=GDP)GDP_Educ.sort$CountryCode, main ="GDP vs Country ", xlab="GDP", ylab="CountryCode")
#geom_histogram(binwidth=.5, colour="black", fill="white") +
 # geom_vline(aes(xintercept=mean(GDP, na.rm=T)),   # Ignore NA values for mean
             color="red", linetype="dashed", size=1)

ggplot(GDP_Educ.sort, aes(x=GDP)) +
  geom_histogram(binwidth=.5, colour="black", fill="white") +
  geom_vline(aes(xintercept=mean(GDP, na.rm=T)),   # Ignore NA values for mean
             color="red", linetype="dashed", size=1)





