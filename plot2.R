library(tidyverse)

#Question 2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland ( fips == “24510”) from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

emissions_total_b<- NEI %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions))

with(emissions_total_b,
     barplot(height=Emissions/1000, names.arg = year, col = color_range, 
             xlab = "Year", ylab = expression('PM'[2.5]*' in Kilotons'),
             main = expression('Baltimore, Maryland Emissions from 1999 to 2008'))
)

#copiando para png
dev.copy(png, filename="plot2.png")
dev.off()