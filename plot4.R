setwd("~/datascience/")

library(plyr)
library(ggplot2)

NEI <- readRDS("data/fine_particulate_matter/summarySCC_PM25.rds")
SCC <- readRDS("data/fine_particulate_matter/Source_Classification_Code.rds")

## Question 4
coalCodes <- SCC[grep("coal", SCC$EI.Sector, ignore.case = TRUE),]
coalData <- NEI[NEI$SCC %in% coalCodes$SCC,]
coalYearData <- ddply(coalData, c("year"), summarize, totalEmissions = sum(Emissions))
qplot(year, totalEmissions, data = coalYearData, geom = c("point","smooth"), method = "lm")

dev.copy(png, file = "exploratory_analysis_3/plot4.png", width = 480, height = 480)
dev.off()