#library(tidyverse)
#library(readxl)
gapminder<-gapminder::gapminder

# Importing data from excel
raw_fert<-read_excel("indicator undata total_fertility.xlsx")
#changing data from wide to long, (country, year, observation)
fert<- raw_fert %>% 
  rename(country = `Total fertility rate`) %>% 
  gather(key = year, value = fert, - country) %>% 
  mutate(year = as.integer(year))
# More data
raw_mort <- read_excel("indicator gapminder infant_mortality.xlsx") 
# More tyding 
mort<-raw_mort%>%
  rename(country = `Infant mortality rate`) %>% 
  gather(key = year, value = mort, - country) %>% 
  mutate(year = as.integer(year)) %>% 
  mutate(mort = as.integer(mort))
#Joining the date tydied here with gapminder
gapminder_plus<-gapminder %>% 
  left_join(fert, by = c("year", "country")) %>% 
  left_join(mort, by = c("year", "country")) 

  

write_csv(gapminder_plus, "gapminder_plus.csv")
