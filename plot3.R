## plot3.R

## This code is written to answer the 3rd Qus of the assignment viz.
##
## 3) Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
## Which have seen increases in emissions from 1999-2008? 
## Use the ggplot2 plotting system to make a plot answer this question. 
##
## Use the common code in getdata.R to read the data files and create the 
## NEI and SCC dataframe objects
source("getdata.R")

## create the subset for Baltimore city
Data_Baltimore <- subset(NEI, fips == "24510")

## use aggregate function to create yearwise sum of Emissions for 
## each of the 4 source types -  point, nonpoint, onroad, nonroad
Yrwise_Type_Sum <- aggregate(Emissions ~ year + type, Data_Baltimore, sum)

## load the ggplot2 library
library(ggplot2)

## before plotting, set the device to a PNG file
png("plot3.png", width=600, height=500, bg="transparent")

## initiate the ggplot specifying X, Y data
## use the source type as a factor for specifying
## different colors for each of the 4 lines plotted
gg <- ggplot(Yrwise_Type_Sum, aes(year, Emissions, color=type))

## plot the lines for each of the types, and also specifying
## various labels for the graph
gg <- gg + geom_line() + xlab("Year") +
      ylab("Total PM2.5 Emissions") +
      ggtitle("Total Emissions in Baltimore City - 4 Diff Source Types")
## print the graph
print(gg)

## close the PNG file device
dev.off()