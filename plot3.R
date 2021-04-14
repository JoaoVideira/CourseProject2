#Question 3: Of the four types of sources indicated by the (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 19992008 for Baltimore City? 
#Which have seen increases in emissions from 19992008? Use the ggplot2 plotting system to make a plot answer this question.

emissions_b <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarise(Emissions=sum(Emissions))

b_em_plot <- ggplot(data = emissions_b, aes(x = factor(year), y = Emissions, fill = type, colore = "black")) +
  geom_bar(stat = "identity") + facet_grid(. ~ type) + 
  xlab("Year") + ylab(expression('PM'[2.5]*' Emission')) +
  ggtitle("Baltimore Emissions by Source Type") 
print(b_em_plot)

#copiando para png
dev.copy(png, filename="plot3.png")
dev.off()