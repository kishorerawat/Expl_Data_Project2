## plot5.R

## This code is written to answer the 5th Qus of the assignment viz.
##
## 5) How have emissions from motor vehicle sources changed from 1999-2008 
## in Baltimore City?
##
## Use the common code in getdata.R to read the data files and create the 
## NEI and SCC dataframe objects
source("getdata.R")

## create the subset for Baltimore city
Data_Baltimore <- subset(NEI, fips == "24510")

## Now, select those rows which are due to Motor Vehciles i.e. source type="ON-ROAD"
Data_Vehicles <- subset(Data_Baltimore, type == "ON-ROAD")

## use aggregate function to create yearwise sum of Emissions
Yrwise_Coal_Emissions <- aggregate(Emissions ~ year, Data_Vehicles, sum)

## load the ggplot2 library
library(ggplot2)

## before plotting, set the device to a PNG file
png("plot5.png", width=600, height=500, bg="transparent")

## initiate the ggplot specifying X, Y data
gg <- ggplot(Yrwise_Coal_Emissions, aes(year, Emissions))

## plot the line with labels for the x,y-axis and main title
gg <- gg + geom_line() +
      xlab("Year") +
      ylab("Total PM2.5 Emissions") +
      ggtitle("Total Emissions for Baltimore City From Motor Vehicle Sources - Year 1999-2008")

## print the graph
print(gg)

## close the PNG file device
dev.off()
