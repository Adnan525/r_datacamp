# Use count to find the number of counties in each region
counties_selected %>%
  count(region, sort = TRUE)



# Find number of counties per state, weighted by citizens, sorted in descending order
counties_selected %>%
  count(state, wt = citizens, sort = TRUE)



counties_selected %>%
  # Add population_walk containing the total number of people who walk to work
  mutate(population_walk = (walk/100)*population) %>%
  count(state, wt = population_walk, sort = TRUE)

  # Count weighted by the new column, sort in descending order