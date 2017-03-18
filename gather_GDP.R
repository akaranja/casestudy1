library(downloader)
download("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile ="GDPData.csv")

#Read the GDPData into R and check it out
GDP<- read.csv("GDPData.csv")
str(GDP)

#only the rows with observations(without the headings)
FGDPData <- GDP[5:194,]

#cleaning up the GDPData
##remove columns with NA and missing values
newGDP <- FGDPData[c(-3,-6,-7,-8,-9,-10)]
head(newGDP)

## Give names to the clean GDPData
names(newGDP)<-c("CountryCode", "Ranking", "Country", "Millions_Of_US_Dollars")
head(newGDP)
list(newGDP)


