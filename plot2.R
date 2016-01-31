

#Q2.Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

plot2<- function()
{
        
        setwd("C:/CourseraProjects/EDA")
        
        ## Time consuming file read, take few extra seconds
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

        NEIbal <- NEI[NEI$fips=="24510",]
        NEIAggTotbal <- aggregate(Emissions ~ year, NEIbal,sum)
        
        barplot(
                NEIAggTotbal$Emissions,
                names.arg=NEIAggTotbal$year,
                xlab="Year",
                ylab="PM2.5 Emissions (Tons)",
                main="Total PM2.5 Emissions From All Baltimore City Sources"
        )
}
