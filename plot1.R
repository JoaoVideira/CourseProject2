#dezipando e lendo os dados
exdata_file <- "exdata-data-NEI_data.zip"

if (!file.exists(exdata_file)) {
  download_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(download_url, destfile = exdata_file)
  unzip (zipfile = exdata_file)
}

if (!exists("NEI")) {
  # print("Loading NEI Data, please wait.")
  NEI <- readRDS("summarySCC_PM25.rds") 
}

if (!exists("SCC")) {
  # print("Loading SCC Data.")
  SCC <- readRDS("Source_Classification_Code.rds")
}

#vendo cinco primeiros dados da base
head(NEI)

#vendo os cinco primeiros dados codigo
head(SCC[,c("SCC", "Short.Name")])

#Question 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
#for each of the years 1999, 2002, 2005, and 2008.

emi_total_anual <- aggregate(Emissions ~ year, NEI, FUN = sum)
color_range <- 2:(length(emi_total_anual$year)+1)
with(emi_total_anual, 
     barplot(height=Emissions/1000, names.arg = year, col = color_range, 
             xlab = "Year", ylab = expression('PM'[2.5]*' in Kilotons'),
             main = expression('Annual Emission PM'[2.5]*' from 1999 to 2008')))

