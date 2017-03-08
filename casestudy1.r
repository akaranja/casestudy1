# Download the files for the case Study
library(downloader)
download("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile ="GDPData.csv")
download("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile="EducationData.csv")

#Read the GDPData into R and check it out
GDP<- read.csv("GDPData.csv")
str(GDP)
#Read the EducationData into R and chek it out
EducData<-read.csv("EducationData.csv")
str(EducData)
#only the rows with observations(without the headings)
FGDPData <- GDP[5:194,]
EducationData<- EducData[1:234,]

#cleaning up the Data
##remove columns with NA and missing values
newGDP <- FGDPData[c(-3,-6,-7,-8,-9,-10)]
head(newGDP)

names(newGDP)<-c("CountryCode", "Ranking", "Country", "Millions_Of_US_Dollars")
head(newGDP)




