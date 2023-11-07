library(gapminder)
library(dplyr)

# functions
# - mean
# - sum
# - median
# - min
# - max

gapminder %>% 
  filter(year == 2007) %>% 
  group_by(continent) %>% 
  summarise(avg_life_exp = mean(lifeExp))

gapminder %>% 
  filter(year == 1957) %>% 
  summarise(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))

# Find median life expectancy and maximum GDP per capita in each year
gapminder %>% 
  group_by(year) %>% 
  summarise(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))
# Find median life expectancy and maximum GDP per capita in each continent in 1957
gapminder %>% 
  filter(year == 1957) %>%
  group_by(continent) %>% 
  summarise(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))
# Find median life expectancy and maximum GDP per capita in each continent/year combination
gapminder %>% 
  group_by(continent, year) %>% 
  summarise(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))

# Create a scatter plot showing the change in medianLifeExp over time
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))
ggplot(by_year, aes(x  = year, y = medianLifeExp))+
  geom_point()+
  expand_limits(y = 0) # make sure y starts at 0

# Summarize medianGdpPercap within each continent within each year: by_year_continent
by_year_continent <- gapminder %>% 
  group_by(continent, year) %>% 
  summarise(medianGdpPercap = median(gdpPercap))

# Plot the change in medianGdpPercap in each continent over time
ggplot(by_year_continent, aes(x = year, y = medianGdpPercap, color = continent))+
  geom_point()+
  expand_limits(y = 0)


# Summarize the median GDP and median life expectancy per continent in 2007
by_continent_2007 <- gapminder %>% 
  filter(year == 2007) %>% 
  group_by(continent) %>% 
  summarise(medianLifeExp = median(lifeExp),
            medianGdpPercap = median(gdpPercap))

# Use a scatter plot to compare the median GDP and median life expectancy
ggplot(by_continent_2007, aes(x = medianGdpPercap, y = medianLifeExp, color = continent))+
  geom_point()
