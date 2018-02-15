#' ---
#' title: "R tidyverse workshop"
#' author: "`Carpentry@UiO`"
#' date: "`r format(Sys.Date())`"
#' output: github_document
#' ---

#' *Read more about this type of document in 
#' [Chapter 20 of "Happy Git with R"](http://happygitwithr.com/r-test-drive.html)*
#'  
#' Uncomment the following lines to install necessary packages

#install.packages("tidyverse")
#install.packages("maps")
#install.packages("gapminder")

#' First we need to load libraries installed previously
library(tidyverse)

#' We will source `gapminder` dataset into the session and assign it 
#' to the variable with the same name
gapminder <- gapminder::gapminder

#' Let's make our first plot
ggplot(gapminder)+
  geom_point(mapping = aes(x=gdpPercap, y=lifeExp))

#' Generally speaking ggplot2 syntax follows the template:
# ggplot(<DATA>) +
#   geom_<GEOM_FUNCTION>(mapping=aes(<AESTETICS>))

#' Let's learn some more about `ggplot2` and its functions!
ggplot(gapminder)+
  geom_point(mapping = aes(x=log(gdpPercap), y=lifeExp, color=year, size=pop, shape=continent))


ggplot(gapminder)+
  geom_point(mapping = aes(x=gdpPercap, y=lifeExp),color="blue", alpha=0.1)

ggplot(gapminder)+
  geom_line(mapping = aes(x=year, y=lifeExp,color=continent, group=country))

ggplot(gapminder, mapping =aes(x=continent, y=lifeExp, color=continent))+
         geom_boxplot()+
         geom_jitter()

ggplot(gapminder, mapping = aes(x=gdpPercap, y=lifeExp))+
  geom_smooth(method="lm")+
  geom_point(mapping = aes(color=continent), alpha=0.3)+
  scale_x_log10()

ggplot(gapminder)+
  geom_boxplot(mapping=aes(x=year,y=gdpPercap,group=year))+
  scale_y_log10()


#geom_jitter(mapping=aes(x=year,y=gdpPercap, color=continent))

ggplot(gapminder)+
  geom_histogram(mapping=aes(x=gdpPercap),bins =100)+
  scale_x_log10()

ggplot(gapminder)+
  geom_density2d(mapping=aes(x=gdpPercap, y=lifeExp,color=continent))+
  scale_x_log10()
  
  

ggplot(gapminder,mapping = aes(x=gdpPercap, y=lifeExp))+
  geom_point()+
  geom_smooth()+
  facet_wrap(~continent)


#install.package("plotly")
#library(plotly)

p <-ggplot(gapminder)+
  geom_point(mapping=aes(x=gdpPercap,y=lifeExp,color=continent, size=pop, frame=year))+
  scale_x_log10()+
  labs(x="GDP per capita in '000 USD",
       y="Life expectancy at birth, years",
       color="Continent",
       size="Population",
       title="How the world goes to hell",
       subtitle="People live to long and eat to much",
       caption="This is something weired from the GGAPMINER.ORG foundation")
p<-ggplotly(p)

p

#Necessary packages:   
install.package("plotly")
library(plotly)

#Makes the plots:
p <-ggplot(gapminder)+
  geom_point(mapping=aes(x=gdpPercap,y=lifeExp,color=continent, size=pop, frame=year))+
  scale_x_log10()+
  labs(x="GDP per capita in '000 USD",
       y="Life expectancy at birth, years",
       color="Continent",
       size="Population",
       title="How the world goes to hell",
       subtitle="People live to long and eat to much",
       caption="This is something weired from the GAPMINER.ORG foundation")

#Converts the plots into an animation       
p<-ggplotly(p)

#Runs the animation
p

install.packages("gganimate")
  