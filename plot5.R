setwd("~/datascience/")

library(plyr)
library(ggplot2)

NEI <- readRDS("data/fine_particulate_matter/summarySCC_PM25.rds")
SCC <- readRDS("data/fine_particulate_matter/Source_Classification_Code.rds")

## Question 5
NEIBaltimore <- NEI[NEI$fips == "24510",]
motorVehicleCodes <- SCC[grep("highway vehicles", SCC$SCC.Level.Two, ignore.case = TRUE),]
motorVehicleData <- NEIBaltimore[NEIBaltimore$SCC %in% motorVehicleCodes$SCC,]
motorVehicleYearData <- ddply(motorVehicleData, c("year"), summarize, totalEmissions = sum(Emissions))
qplot(year, totalEmissions, data = motorVehicleYearData, geom = c("point","smooth"), method = "lm")

dev.copy(png, file = "exploratory_analysis_3/plot5.png", width = 480, height = 480)
dev.off()