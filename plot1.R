setwd("~/datascience/")

library(plyr)

NEI <- readRDS("data/fine_particulate_matter/summarySCC_PM25.rds")
SCC <- readRDS("data/fine_particulate_matter/Source_Classification_Code.rds")

## Question 1
yearData <- ddply(NEI, c("year"), summarize, totalEmissions = sum(Emissions))
plot(yearData)

dev.copy(png, file = "exploratory_analysis_3/plot1.png", width = 480, height = 480)
dev.off()