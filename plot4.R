
   
        
# 4.Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

##Note: The SCC levels go from generic to specific. We assume that coal combustion 
#related SCC records are those where SCC.Level.One contains the substring 'comb' and SCC.Level.
#Four contains the substring 'coal'.


plot4<- function()
{
        
        setwd("C:/CourseraProjects/EDA")
        
        library(ggplot2)

        ## Time consuming file read, take few extra seconds
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
        # Subset coal combustion related NEI data
        combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
        coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
        coalCombustion <- (combustionRelated & coalRelated)
        combustionSCC <- SCC[coalCombustion,]$SCC
        combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]
        
        ggp <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
                geom_bar(stat="identity",fill="grey",width=0.75) +
                theme_bw() +  guides(fill=FALSE) +
                labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
                labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
        
        print(ggp)
        
        
}

