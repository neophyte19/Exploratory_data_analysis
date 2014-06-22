# read data files into R
summarydata <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
sourceclass <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")


sub <- subset(summarydata, fips =='24510')
agg <- aggregate(sub[, 'Emissions'], by=list(sub$year), FUN=sum)

png(filename='plot2.png')

barplot(agg$Emissions,names.arg=agg$Year,xlab='Year',ylab=expression('PM'[2.5]),main='Total Emissions in Baltimore city')

dev.off()