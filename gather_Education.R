# Download the files for the case Study
library(downloader)

download("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile="EducationData.csv")

#Read the EducationData into R and chek it out
EducData<-read.csv("EducationData.csv", header = TRUE)
str(EducData)

#only the rows with observations(without the headings)
EducationData<- EducData[1:234,]

#Clean up EducationData
##how many missing value in each column
colSums(is.na(EducationData))

#remove any columns with <50 missing values
EducationData.clean<-EducationData[ ,colSums(is.na(EducationData))<50]
EducationData.final <- na.omit(EducationData.clean)
nrow(EducationData.final)

View(EducationData.final)
