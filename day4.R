setwd("~/Documents/data_projects/advent-code")

# Every section has a unique ID number, and each Elf is assigned a range of section IDs.
# ... many of the assignments overlap. To try to quickly find overlaps and reduce 
# duplicated effort, the Elves pair up and make a big list of the section 
# assignments for each pair (your puzzle input).

# In how many assignment pairs does one range fully contain the other?

assignments <- readLines("day4-input.txt")

pair_count = 0
i = 1
while(i <= length(assignments)) {
  pair <- as_vector(str_split(assignments[i], ","))
  elf1 <- as.numeric(as_vector(str_split(pair[1], "-")))
  elf2 <- as.numeric(as_vector(str_split(pair[2], "-")))
  
  elf1containself2 = FALSE
  elf2containself1 = FALSE
  
  if((elf1[1] >= elf2[1]) & (elf1[2] <= elf2[2])) {
    elf2containself1 = TRUE
    pair_count = pair_count + 1
  } else if((elf1[1] <= elf2[1]) & (elf1[2] >= elf2[2])) {
    elf1containself2 = TRUE
    pair_count = pair_count + 1
  }
  i = i + 1
}


## PART TWO ##

pair_count = 0
i = 1
while(i <= length(assignments)) {
  pair <- as_vector(str_split(assignments[i], ","))
  elf1 <- as.numeric(as_vector(str_split(pair[1], "-")))
  elf2 <- as.numeric(as_vector(str_split(pair[2], "-")))
  
  elf1_seq <- seq(from=elf1[1], to=elf1[2], by=1)
  elf2_seq <- seq(from=elf2[1], to=elf2[2], by=1)
  
  no_overlap = is_empty(intersect(elf1_seq, elf2_seq))
  
  if(!no_overlap) {
    pair_count = pair_count + 1
  } 
  
  i = i + 1
}
