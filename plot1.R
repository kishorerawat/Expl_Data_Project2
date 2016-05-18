## Plot1.R

## This code is written to the answer the 1st Qus of the assignment viz.
##
## 1) Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.
##
##
## Use the commong code in getdata.R to read the data files and create the 
## NEI and SCC dataframe objects
source("getdata.R")

## We need to plot the "total PM2.5" for all years, so we need to create yearwise
## summary of the data using 
## load the dplyr package
library(dplyr)
## Group the data yearwise first
Yrwise_Grp <- group_by(NEI, year)
## Now, create a summary data, where the sum of "Emissions" is done for each year
Yrwise_Total_Emissions <- summarize(Yrwise_Grp, sum(Emissions))
## Give meaningful column names 
names(Yrwise_Total_Emissions) <- c("Year", "Tot_Emissions")
## before plotting, set the device to a PNG file
png("plot1.png", width=480, height=480, bg="transparent")
## plot the line graph showing a clear downtrend in the PM2.5 emissions from year
## 1999 to 2008
plot(Yrwise_Total_Emissions, xlab="Year", ylab="Total PM2.5 Emissions", 
     main="Total PM2.5 Emissions in US - Years 1999-2008", 
     type="b", lwd=3, pch=9, col="blue", cex=1, col.lab="brown")
## close the PNG file device
dev.off()