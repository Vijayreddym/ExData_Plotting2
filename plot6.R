

# 6.Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle
# sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

plot6<- function()
{
        
        setwd("C:/CourseraProjects/EDA")
        
        library(ggplot2)

        ## Time consuming file read, take few extra seconds
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
        vehiclesSCC <- SCC[vehicles,]$SCC
        vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
        
        #.sources in Los Angeles County, California (fips == "06037"),
        vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips == 24510,]
        vehiclesBaltimoreNEI$city <- "Baltimore City"
        vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
        vehiclesLANEI$city <- "Los Angeles County"
        bothNEI <- rbind(vehiclesBaltimoreNEI,vehiclesLANEI)
        
        #.Now we plot using the ggplot2 system,
        ggp <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
                geom_bar(aes(fill=year),stat="identity") +
                facet_grid(scales="free", space="free", .~city) +
                guides(fill=FALSE) + theme_bw() +
                labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
                labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))
        
        print(ggp)
        
}




