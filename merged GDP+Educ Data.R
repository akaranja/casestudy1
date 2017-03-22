#Merging the data
GDP_Educ<- merge (FGDPData, EducationData.final, by="CountryCode", all=TRUE)
library(reshape2)
GDP_Educ
View(GDP_Educ)
# many missing values per column
colSums(is.na(GDP_Educ))

str(GDP_Educ)
#convert GDP column fron factor to numeric column
GDP_Educ$GDP <- as.numeric(gsub("[^[:digit:]]","", GDP_Educ$GDP))
View(GDP_Educ)


#remove any rows with NAs/missing values in GDP column
GDP_Educ.clean <- GDP_Educ[!is.na(GDP_Educ$GDP),]
View(GDP_Educ.clean)
nrow(GDP_Educ.clean)

# How many Ids match
#GDP_Educ$match <- match(FGDPData$CountryCode, EducationData.final$CountryCode, nomatch=0)
#nrow(GDP_Educ)

#sort the data frame in ascending order
GDP_Educ.sort <-GDP_Educ.clean[order(GDP_Educ.clean$GDP) , ]
View(GDP_Educ.sort)
GDP_Educ.sort[1:15, ]
#the 13th country from sorted dataframe
thirteenth <- GDP_Educ.sort$GDP[13]
