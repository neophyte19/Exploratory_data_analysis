# read data files into R
summarydata <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
sourceclass <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

sub <- subset(summarydata, fips ==24510)
sub$year <- factor(sub$year, levels=c('1999', '2002', '2005', '2008'))

png(filename='plot3.png', width=800, height=500, units='px')

ggplot(data=sub, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
  geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
  ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') +
  ggtitle('Emissions per Type in Baltimore') +
  geom_jitter(alpha=0.10)

dev.off()