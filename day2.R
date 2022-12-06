setwd("~/Documents/data_projects/advent-code")

# Opponent: A Rock, B Paper, C Scissors
# Me: X Rock, Y Paper, Z Scissors
# total score = sum of scores for each round
# shape scores: 1 Rock, 2 Paper, 3 Scissors
# outcome scores: 0 loss, 3 draw, 6 win

guide <- readLines("day2-input.txt")

draws <- c("A X", "B Y", "C Z")
wins <- c("A Y", "B Z", "C X")
losses <- c("A Z", "B X", "C Y")
outcome_score = 0
shape_score = 0 

for(round in guide) {
  throws <- as_vector(str_split(round, "\\s"))
  opp <- throws[1]
  me <- throws[2]
  
  
  if(me == "X") {
    shape_score = shape_score + 1
  } else if(me == "Y") {
    shape_score = shape_score + 2
  } else if(me == "Z") {
    shape_score = shape_score + 3
  }
  
  if(round %in% draws) {
    outcome_score = outcome_score + 3
  } else if(round %in% wins) {
    outcome_score = outcome_score + 6
  } else if(round %in% losses) {
    outcome_score = outcome_score + 0
  }
}

total_score = outcome_score + shape_score

### Part Two ###

# X Lose, Y Draw, Z Win
rock <- c("A Y", "B X", "C Z")
paper <- c("A Z", "B Y", "C X")
scissors <- c("A X", "B Z", "C Y")
outcome_score = 0
shape_score = 0 

for(round in guide) {
  throws <- as_vector(str_split(round, "\\s"))
  opp <- throws[1]
  outcome <- throws[2]
  
  if(outcome == "X") {
    outcome_score = outcome_score + 0
  } else if(outcome == "Y") {
    outcome_score = outcome_score + 3
  } else if(outcome == "Z") {
    outcome_score = outcome_score + 6
  }
  
  if(round %in% rock) {
    shape_score = shape_score + 1
  } else if(round %in% paper) {
    shape_score = shape_score + 2
  } else if(round %in% scissors) {
    shape_score = shape_score + 3
  }
}

total_score = outcome_score + shape_score

