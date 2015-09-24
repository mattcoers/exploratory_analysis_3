setwd("~/datascience/")

library(plyr)
library(ggplot2)

NEI <- readRDS("data/fine_particulate_matter/summarySCC_PM25.rds")
SCC <- readRDS("data/fine_particulate_matter/Source_Classification_Code.rds")

## Question 2
NEIBaltimore <- NEI[NEI$fips == "24510",]
yearBaltimoreData <- ddply(NEIBaltimore, c("year"), summarize, totalEmissions = sum(Emissions))
qplot(year, totalEmissions, data = yearBaltimoreData, geom = c("point", "smooth"), method = "lm")

dev.copy(png, file = "exploratory_analysis_3/plot2.png", width = 480, height = 480)
dev.off()