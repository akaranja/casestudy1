# Download the files for the case Study
library(downloader)
download("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile ="GDPData.csv")
download("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile="EducationData.csv")

#Read the GDPData into R and check it out
GDP<- read.csv("GDPData.csv")
str(GDP)
#Read the EducationData into R and chek it out
EducData<-read.csv("EducationData.csv", header = TRUE)
str(EducData)
#only the rows with observations(without the headings)
FGDPData <- GDP[5:194,]
EducationData<- EducData[1:234,]

#cleaning up the GDPData
##remove columns with NA and missing values
FGDPData[ ,3] <- NULL
str(FGDPData)
head(FGDPData)
# more NA columns
FGDPData[ ,5:9] <- NULL
str(FGDPData)
head(FGDPData)

## Give names to the clean GDPData
names(FGDPData)<-c("CountryCode", "Ranking", "Country", "Millions_Of_US_Dollars")
head(FGDPData)
list(FGDPData)



#Clean up EducationData
##remove columns with NA and missing values.
head(EducationData)
list(EducationData)

#Merging the data
GDP_Educ<- merge (newGDP, EducationData, by="CountryCode", all=TRUE)


