setwd("~/Documents/data_projects/advent-code")
# 
# Each rucksack has two large compartments. 
# All items of a given type are meant to go into exactly one of the two compartments. 
# The Elf that did the packing failed to follow this rule for exactly one item type per rucksack.

# the first half of the characters represent items in the first compartment, 
# while the second half of the characters represent items in the second compartment.

# Lowercase item types a through z have priorities 1 through 26.
# Uppercase item types A through Z have priorities 27 through 52.

# Find the item type that appears in both compartments of each rucksack. 
# What is the sum of the priorities of those item types?

rucksacks <- readLines("day3-input.txt")

lower_priorities <- letters[seq(1, 26)]
upper_priorities <- LETTERS[seq(1, 26)]

priority_score = 0

for(sack in rucksacks) {
  halfpoint <- str_length(sack)/2
  first <- str_sub(sack, 1, halfpoint)
  second <- str_sub(sack, halfpoint+1, str_length(sack))
  
  first_chars <- as_vector(str_split(first, ""))
  second_chars <- as_vector(str_split(second, ""))
  common_item <- intersect(first_chars, second_chars)
  
  if(common_item %in% lower_priorities) {
    priority <- which(lower_priorities == common_item)
  } else if (common_item %in% upper_priorities) {
    priority <- which(upper_priorities == common_item) + 26
  }
  
  priority_score = priority_score + priority 
}

priority_score

## Part Two ##

# the Elves are divided into groups of three. 
# Every Elf carries a badge that identifies their group. 
# For efficiency, within each group of three Elves, 
# the badge is the only item type carried by all three Elves.

rucksacks <- readLines("day3-input.txt")

lower_priorities <- letters[seq(1, 26)]
upper_priorities <- LETTERS[seq(1, 26)]

priority_score = 0
i = 1
while(i <= length(rucksacks)) {
  
    #elf_group <- rucksacks[i:(i+2)]
    
    sack1 <- as_vector(str_split(rucksacks[i], ""))
    sack2 <- as_vector(str_split(rucksacks[i+1], ""))
    sack3 <- as_vector(str_split(rucksacks[i+2], ""))
    
    common_item <- intersect(intersect(sack1, sack2), sack3)
    
    if(common_item %in% lower_priorities) {
      priority <- which(lower_priorities == common_item)
    } else if (common_item %in% upper_priorities) {
      priority <- which(upper_priorities == common_item) + 26
    }
    
    i = i + 3
    priority_score = priority_score + priority 
    
}

