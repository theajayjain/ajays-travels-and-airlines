library(ggplot2)
airports = read.csv("airports.csv", header = FALSE)
colnames(airports) = c("Airport", "Continent", "Country", "Visits", "Destinations")

ggplot(airports) + geom_bar(aes(x = Continent))
ggplot(airports) + geom_bar(aes(x = Airport, y = Visits), stat = "identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1))

yearData = data.frame(year = seq(1998,2021), visits = c(6, 8, 8, 8, 14, 8, 14, 3, 11, 8, 7, 8, 0, 4, 3, 2, 4, 2, 33, 32, 30, 50, 18, 35))
ggplot(yearData) + geom_line(aes(x = year, y = visits))
ggplot(airports) + geom_bar(aes(x = Airport, y = Destinations), stat = "identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1)) + ylab("Linked Destinations")

airports$visitDestinationRatio = airports$Destinations / airports$Visits
colnames(airports) = c("Airport", "Continent", "Country", "Visits", "Destinations", "Diversity Ratio")
airports$yearVisited = c(1998, 1998, 1998, 2003, 2006, 2005, 2007, 2011, 2011, 2017, 2016, 2009, 2016, 2016, 2002, 2016, 2018, 2002, 2019, 2006, 2015, 2018, 2007, 2017, 1999, 2019, 2016, 2019, 2018, 2018, 2004, 2018, 2020, 2017, 2018, 2016, 2020, 2006, 2002, 2019, 2001, 2019, 2016, 2016, 2019, 2019, 2017, 2018, 2018, 2017, 2014, 2018, 2019, 2018, 2021, 2021, 2021, 2021, 2021, 2021, 2021, 2021)

ggplot(airports) + geom_bar(aes(x = yearVisited, fill = factor(yearVisited))) + ylab('Number of New Airports Visited') + xlab('Year') + scale_y_continuous(breaks=c(0,1,2,3,4,5,6,7,8,9,10))

