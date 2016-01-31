

# 5.How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

plot5<- function()
{
        
        setwd("C:/CourseraProjects/EDA")
        
        library(ggplot2)
        
        ## Time consuming file read, take few extra seconds
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        #.First we subset the motor vehicles, which we assume is anything like Motor Vehicle in SCC.Level.Two.
        vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
        vehiclesSCC <- SCC[vehicles,]$SCC
        vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
        
        #.Next we subset for motor vehicles in Baltimore,
        baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips==24510,]
        
        #.Finally we plot using ggplot2,
        ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
                geom_bar(stat="identity",fill="grey",width=0.75) +
                theme_bw() +  guides(fill=FALSE) +
                labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
                labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))
        
        print(ggp)
        
        
}


