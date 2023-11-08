df <- iris

colnames(df)
# "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species" 

# mutate can be used to select as well, .keep = none
test_df <- df %>%
  mutate(Sepal.Width, test = Sepal.Width + 1, .keep = "none")



counties_selected <- counties %>%
  select(state, county, population, public_work)

counties_selected %>%
  mutate(public_workers = public_work * population / 100) %>%
  # Sort in descending order of the public_workers column
  arrange(desc(public_workers))



counties %>%
  # Keep state, county and add proportion_men
  mutate(state, county, population, proportion_men = men/population, .keep = "none") %>%
  # Filter for population of at least 10,000
  filter(population >= 10000) %>%
  # Arrange proportion of men in descending order 
  arrange(desc(proportion_men))