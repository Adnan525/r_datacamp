# chapter 2 ggplot
library(ggplot2)
library(dplyr)
library(gapminder)

# ggplot has 3 parts
# - data
# - mapping x and y axis
# - plot typle e.g. geom_point

gapminder_1952 <- gapminder %>% 
  filter(year == 1952)

# pop vs gdp
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap))+
  geom_point()

# pop vs lifexp
ggplot(gapminder_1952, aes(x = pop, y = lifeExp))+
  geom_point()

# gdp vs life exp and log scale
ggplot(gapminder_1952, aes(x = gdpPercap, y = lifeExp))+
  geom_point()+
  scale_x_log10()

# additional aesthetics
# scatter plot color or fill
# size
ggplot(gapminder_1952, aes(x = pop, y = lifeExp, 
                           color = continent,
                           size = gdpPercap))+
  geom_point()+
  scale_x_log10()

# faceting
# creating auto subplots like "groupby"
# in R ~ usually means "by"
ggplot(gapminder_1952, aes(x = pop, y = lifeExp))+
  geom_point()+
  facet_wrap(~continent)

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp,
                           color = continent,
                           size = pop))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)
