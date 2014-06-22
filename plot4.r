# read data files into R
summarydata <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
sourceclass <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

coal <- sourceclass[grep('coal',sourceclass$Short.Name,ignore.case=TRUE),]

mergeddata <- merge(x=summarydata, y=coal, by='SCC')

agg <- aggregate(mergeddata[, 'Emissions'], by=list(mergeddata$year), sum)
colnames(agg.sum) <- c('Year', 'Emissions')

png(filename='plot4.png')

ggplot(data=agg, aes(x=Year, y=Emissions/1000)) +
  geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) +
  ggtitle(expression('Total Emissions of PM'[2.5])) +
  ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) +
  geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) +
  theme(legend.position='none') + scale_colour_gradient(low='red', high='green')

dev.off()