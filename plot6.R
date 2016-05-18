## plot6.R

## This code is written to answer the 6th Qus of the assignment viz.
##
## 6) Compare emissions from motor vehicle sources in Baltimore City with 
##    emissions from motor vehicle sources in Los Angeles County, California (fips == "06037").
##    Which city has seen greater changes over time in motor vehicle emissions?
##
## Use the common code in getdata.R to read the data files and create the 
## NEI and SCC dataframe objects
source("getdata.R")

## create the subset for Baltimore city
Data_Baltimore <- subset(NEI, fips == "24510")

## create the subset for LA County, California
Data_LA <- subset(NEI, fips == "06037")
  
## Now, select those rows which are due to Motor Vehciles for Baltimore
## i.e. source type="ON-ROAD"
Data_Vehicles_Baltimore <- subset(Data_Baltimore, type == "ON-ROAD")

## Similarly, select those rows which are due to Motor Vehciles for LA County,
## California i.e. source type="ON-ROAD"
Data_Vehicles_LA <- subset(Data_LA, type == "ON-ROAD")

## use aggregate function to create yearwise sum of Emissions for Baltimore
Yrwise_Coal_Emissions_Baltimore <- aggregate(Emissions ~ year, Data_Vehicles_Baltimore, sum)

## Same for LA County, California
Yrwise_Coal_Emissions_LA <- aggregate(Emissions ~ year, Data_Vehicles_LA, sum)

## before plotting, set the device to a PNG file
png("plot6.png", width=600, height=500, bg="transparent")

## set the plotting area as 2 columns and 1 row, to plot both these plots 
## side-by-side i.e one each for Baltimore and LA County, California
par(mfrow=c(1,2), mar=c(4,4,2,2))

plot(Yrwise_Coal_Emissions_Baltimore, pch=9, col="blue", 
     lwd=3, type="b",
     xlab="Year", 
     ylab="Total PM2.5 Emissions", 
     main="Baltimore & LA - 1999-2008")

plot(Yrwise_Coal_Emissions_LA, pch=9, col="red", 
     lwd=3, type="b",
     xlab="Year", ylab="Total PM2.5 Emissions")

## close the PNG file device
dev.off()
