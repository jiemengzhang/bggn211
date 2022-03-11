# Class 5 Data Visualization


plot(1:5)



# That was base R plot - quick and not very nice!
# We will use an add on package called ggplot2.

library(ggplot2)
# Before I can use any functions from this package
# I need to load it with the library() call!

plot(cars)

# Every ggplot has at least 3 layers
# data + aes + geoms

p <- ggplot(data=cars) +  
  aes(x=speed, y=dist) +
  geom_point()


p + geom_line()

p + geom_smooth(method = "lm")  

p + labs(title = "Speed and Stopping Distance of Cars",
         subtitle = "Note: We will see the code for this plot in a moment",
         caption = "Dataset:'cars'",
         #x = "Speed(MPH)",
         y = "Stopping Distance (ft)") +
   xlab("Speed(MPH)")

url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

p1 <- ggplot(genes) +
  aes(x=Condition1, y=Condition2, col= State) +
  geom_point()

p1 + labs(title = "Gene Expression Changes Upon drug Treatment",
          subtitle = "Just another scater made with ggplot",
          caption = "BIMM143",
          x = "Control(no drug)",
          y = "Drug Treatment") +
  scale_colour_manual( values=c("blue","gray","red") )

# install.packages("gapminder")
library(gapminder)
url <- "https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv"

gapminder <- read.delim(url)

library(dplyr)

gapminder_2007 <- gapminder %>% filter(year==2007)

ggplot(gapminder_2007) +
  aes(x=gdpPercap, y=lifeExp,col=continent,size=pop) +
  geom_point(alpha=0.5)


ggplot(gapminder_2007) +
  aes(x=gdpPercap, y=lifeExp,col=pop) +
  geom_point(alpha=0.8)

ggplot(gapminder_2007) +
  aes(x=gdpPercap, y=lifeExp,size=pop) +
  geom_point(alpha=0.5)


ggplot(gapminder_2007) +
     geom_point(aes(x=gdpPercap, y=lifeExp,size=pop),alpha=0.5) +
     scale_size_area(max_size = 10)

p3 <- ggplot(gapminder_2007) +
  geom_point(aes(x=gdpPercap, y=lifeExp,col=continent,size=pop),alpha=0.7) +
  scale_size_area(max_size = 10) +
  facet_wrap(~year)

gapminder_1957 <- gapminder %>% filter(year==1957)

p4 <- ggplot(gapminder_1957) +
     geom_point(aes(x=gdpPercap, y=lifeExp,col=continent,size=pop),alpha=0.7) +
     scale_size_area(max_size = 10) +
     facet_wrap(~year)
  
p3 
p4 
gapminder_2 <- gapminder %>% filter(year==1957 | year==2007)
ggplot(gapminder_2) +
  geom_point(aes(x=gdpPercap, y=lifeExp,col=continent,size=pop),alpha=0.7) +
  scale_size_area(max_size = 10) +
  facet_wrap(~year)
  

