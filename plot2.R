## plot2.R

## This code is written to the answer the 2nd Qus of the assignment viz.
##
## 2) Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.
##
## Use the common code in getdata.R to read the data files and create the 
## NEI and SCC dataframe objects
source("getdata.R")

## We need to plot the "total PM2.5" for all years for Baltimore City, so we need to first filter
## the data to extract the emission data for only that city (fips == "24510")
## first, load the dplyr package
library(dplyr)

## create the subset for Baltimore city
Data_Baltimore <- subset(NEI, fips == "24510")

## Group the data yearwise first
Yrwise_Grp <- group_by(Data_Baltimore, year)
## Now, create a summary data, where the sum of "Emissions" is done for each year
Yrwise_Total_Emissions <- summarize(Yrwise_Grp, sum(Emissions))

## Give meaningful column names 
names(Yrwise_Total_Emissions) <- c("Year", "Tot_Emissions")

## before plotting, set the device to a PNG file
png("plot2.png", width=480, height=480, bg="transparent")

## plot the line graph showing a clear downtrend in the PM2.5 emissions from year
## 1999 to 2008
plot(Yrwise_Total_Emissions, xlab="Year", ylab="Total PM2.5 Emissions", 
     main="Total PM2.5 Emissions for Baltimore City - Years 1999-2008", 
     type="b", lwd=3, pch=9, col="blue", cex=1, col.lab="brown")

## close the PNG file device
dev.off()