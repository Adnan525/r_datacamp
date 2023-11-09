library(tidyverse)

parts <- read.csv("data/parts.csv")
part_categories <- read.csv("data/part_categories.csv")

# inner join
# works same both ways
temp <- parts %>% 
  inner_join(part_categories, by = c("part_cat_id" = "id"), 
             suffix = c("_part", "_category"))

# one-to-many
inventories <- read.csv("data/inventories.csv")
sets <- read.csv("data/sets.csv")

inven_sets <- inventories %>% 
  inner_join(sets, by = "set_num")

# inventory_parts and parts
inventory_parts <- read.csv("data/inventory_parts.csv")
parts %>% 
  inner_join(inventory_parts, by = "part_num")


# joining more than 2
sets <- read.csv("data/sets.csv")
pop_colour <- sets %>% 
  inner_join(inventories, by = "set_num")  %>% 
  inner_join(inventory_parts, by = c("id" = "inventory_id"))
colors <- read.csv("data/colors.csv")
pop_colour %>% 
  inner_join(colors, by = c("color_id" = "id"), suffix = c("_set", "_color")) %>% 
  count(name_color, sort = TRUE)


# dont have the exact dataset
# left join
millennium_falcon <- inventory_parts_joined %>%
  filter(set_num == "7965-1")
star_destroyer <- inventory_parts_joined %>%
  filter(set_num == "75190-1")
# Combine the star_destroyer and millennium_falcon tables
millennium_falcon %>%
  left_join(star_destroyer, by = c("part_num", "color_id"), suffix = c("_falcon", "_star_destroyer"))

# we want to know the color quantity in the falcon and star_destroyer sets
# Aggregate Millennium Falcon for the total quantity in each part
millennium_falcon_colors <- millennium_falcon %>%
  group_by(color_id) %>%
  summarize(total_quantity = sum(quantity))

# Aggregate Star Destroyer for the total quantity in each part
star_destroyer_colors <- star_destroyer %>%
  group_by(color_id) %>%
  summarize(total_quantity = sum(quantity))

# Left join the Millennium Falcon colors to the Star Destroyer colors
millennium_falcon_colors %>%
  left_join(star_destroyer_colors, by = "color_id", suffix = c("_falcon", "_star_destroyer"))

inventory_version_1 <- inventories %>%
  filter(version == 1)


#the inventories table has a version column, for when a LEGO kit gets some kind of change or upgrade. 
#It would be fair to assume that all sets (which joins well with inventories) would have at least a version 1. 
#But let's test this assumption out in the following exercise.

# Join versions to sets
# both have set_num
sets %>%
  left_join(inventory_version_1, by = "set_num", suffix = c("_set", "_inventory")) %>%
  # Filter for where version is na
  filter(is.na(version))

