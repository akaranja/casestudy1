library(downloader)
download("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile ="GDPData.csv")

#Read the GDPData into R and check it out
GDP<- read.csv("GDPData.csv")
str(GDP)

#only the rows with observations(without the headings)
FGDPData <- GDP[5:194,]

##remove columns with NA and missing values
##how many missing value in each column
FGDPData[ ,3] <- NULL
str(FGDPData)
head(FGDPData)
# more NA columns
FGDPData[ ,5:9] <- NULL
str(FGDPData)
head(FGDPData)

## Give names to column in the clean GDPData
names(FGDPData)<-c("CountryCode", "Ranking", "Country", "GDP")
head(FGDPData)
list(FGDPData)
library(readr)

View(FGDPData)




