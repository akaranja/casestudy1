#Merging the data
GDP_Educ<- merge (FGDPData, EducationData.final, by="CountryCode", all=TRUE)
library(reshape2)
GDP_Educ
View(GDP_Educ)
# many missing values per column
colSums(is.na(GDP_Educ))


#remove any rows with NAs/missing values in ranking column
GDP_Educ.clean <- GDP_Educ[!is.na(GDP_Educ$Ranking),]
View(GDP_Educ.clean)
nrow(GDP_Educ.clean)

# How many Ids match
GDP_Educ$match <- match(FGDPData$CountryCode, EducationData.final$CountryCode, nomatch=0)
nrow(GDP_Educ)

#sort the data frame in ascending order
GDP_Educ.sort <- GDP_Educ.clean[order(GDP) , ]
GDP_Educ.sort[1:15]

sort1.hsb2 <- hsb2[order(read) , ]
sort1.hsb2[1:15, ]
