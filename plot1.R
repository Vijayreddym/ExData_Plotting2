
# Q1 Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources
#for each of the years 1999, 2002, 2005, and 2008.


plot1<- function()
{
        
        setwd("C:/CourseraProjects/EDA")
        
        ## Time consuming file read, take few extra seconds
        NEI  <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

        aggEmissions <- aggregate(Emissions ~ year,NEI, sum)
        
        barplot(
                (aggEmissions$Emissions)/10^6,
                names.arg=aggEmissions$year,
                xlab="Year",
                ylab="PM2.5 Emissions (10^6 Tons)",
                main="Total PM2.5 Emissions From All US Sources"
        )
        

}

