## plot4.R

## This code is written to answer the 4th Qus of the assignment viz.
##
## 4) Across the United States, how have emissions from coal combustion-related 
##    sources changed from 1999-2008?
##
## Use the common code in getdata.R to read the data files and create the 
## NEI and SCC dataframe objects
source("getdata.R")

## From the Classification file, filter out only those which are related to "Coal"
SCC_Coal <- filter(SCC, grepl("Coal", SCC$Short.Name, ignore.case = TRUE))

## Create a subset of the main dataset NEI for only those sources which match
## this "Coal" related sources, we do this by matching the "SCC" column in both 
## these datasets
NEI_For_Coal <- subset(NEI, NEI$SCC %in% SCC_Coal$SCC)

## use aggregate function to create yearwise sum of Emissions
Yrwise_Coal_Emissions <- aggregate(Emissions ~ year, NEI_For_Coal, sum)

## load the ggplot2 library
library(ggplot2)

## before plotting, set the device to a PNG file
png("plot4.png", width=600, height=500, bg="transparent")

## initiate the ggplot specifying X, Y data
gg <- ggplot(Yrwise_Coal_Emissions, aes(year, Emissions))

## plot the line with labels for the x,y-axis and main title
gg <- gg + geom_line() +
      xlab("Year") +
      ylab("Total PM2.5 Emissions") +
      ggtitle("Total Emissions in US from Coal Combustion-sources - Year 1999-2008")

## print the graph
print(gg)

## close the PNG file device
dev.off()
