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
