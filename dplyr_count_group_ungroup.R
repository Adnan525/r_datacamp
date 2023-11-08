# Summarize to find minimum population, maximum unemployment, and average incomw
counties_selected %>%
summarise(min_population = min(population),
max_unemployment = max(unemployment),
average_income = mean(income))



# Add a density column
# Sort by density in descending order
counties_selected %>%
  group_by(state) %>%
  summarize(total_area = sum(land_area),
            total_population = sum(population)) %>%
    mutate(density = total_population/total_area) %>%
    arrange(desc(density))