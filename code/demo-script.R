# ===================================================================
# Title: Descriptive Analysis
# Description:
#   This script computes descriptive statistics, as well as 
#   various exploratory data visualizations.
# Input(s): data file 'nba2018-players.csv'
# Output(s): summary data files, and plots
# Author: Alice Young
# Date: 10-3-2019
# ===================================================================

# packages
library(dplyr)
library(ggplot2)

dat = read.csv("../data/nba2018-players.csv")
warriors = sort(filter(dat,team='GSW'), salary)
warriors
write.csv(warriors, file="../data/warriors.csv", row.names=FALSE)

sink(file = '../output/data-structure.txt')
str(dat)
sink()

sink(file='../output/summary-warriors.txt')
summary(warriors)
sink()

lakers = filter(dat, team=='LAL')

sink(file='../output/summary-lakers.txt')
summary(lakers)
sink()

png(filename="../images/scatter-height-weight.png")
plot(dat$height, dat$weight, pch=20, xlab='Height', ylab='Weight')
dev.off()

jpeg(filename='../images/histogram-age.jpeg', width=600, height=400, units='px')
hist(dat$age)
dev.off()

jpeg(filename='../images/scatterplot2-height-weight.png', pointsize=5)
plot(dat$height, dat$weight, pch=20, xlab='Height', ylab='Weight')
dev.off()

ggsave(filename='../images/height_weight_by_position.pdf')
ggplot(data=dat, aes(x=height, y=weight)) + geom_point() + facet_wrap(~ position)
dev.off()
