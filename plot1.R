# read data files into R
summarydata <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
sourceclass <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

#find total emissions for all years
emissions <- aggregate(summarydata[, 'Emissions'], by=list(summarydata$year), FUN=sum)

#assign meaningful column names
names(emissions) <- c("Year","Emissions")

#convert emissions in kilotons
emissions$PM <- round(emissions[,2]/1000,2)

#plot the chart
png(filename='plot1.png')
barplot(emissions$PM, names.arg = emissions$Year, main = expression('Total emission of PM'[2.5]), xlab = 'Year' , ylab = 'PM[2.5]emissions in kilotons')
dev.off()
