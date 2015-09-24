setwd("~/datascience/")

library(plyr)
library(ggplot2)

NEI <- readRDS("data/fine_particulate_matter/summarySCC_PM25.rds")
SCC <- readRDS("data/fine_particulate_matter/Source_Classification_Code.rds")

## Question 6
NEIBaltimoreLA <- NEI[(NEI$fips == "24510") | (NEI$fips == "06037"),]
NEIBaltimoreLA$fips[NEIBaltimoreLA$fips == "24510"] <- "Baltimore"
NEIBaltimoreLA$fips[NEIBaltimoreLA$fips == "06037"] <- "Los Angeles"
motorVehicleCodes <- SCC[grep("highway vehicles", SCC$SCC.Level.Two, ignore.case = TRUE),]
motorVehicleData <- NEIBaltimoreLA[NEIBaltimoreLA$SCC %in% motorVehicleCodes$SCC,]
motorVehicleYearData <- ddply(motorVehicleData, c("year", "fips"), summarize, totalEmissions = sum(Emissions))
qplot(year, totalEmissions, data = motorVehicleYearData, geom = c("point","smooth"), method = "lm", facets = .~fips)

dev.copy(png, file = "exploratory_analysis_3/plot6.png", width = 480, height = 480)
dev.off()