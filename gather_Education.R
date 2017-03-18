# Download the files for the case Study
library(downloader)

download("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile="EducationData.csv")

#Read the EducationData into R and chek it out
EducData<-read.csv("EducationData.csv", header = TRUE)
str(EducData)

#only the rows with observations(without the headings)
FGDPData <- GDP[5:194,]
EducationData<- EducData[1:234,]

#Clean up EducationData
##remove columns with NA and missing values.
head(EducationData)
list(EducationData)