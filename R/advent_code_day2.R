######################## DAY 2 ###############################

#read input
input <- read.delim("advent2.txt", sep="", header=FALSE)

#First column
# A rock 
# B Paper 
# C Scissors

#Second column
# X rock (1)
# Y paper (2)
# Z scissor (3)

# 6 point win, 3 points draw, 0 points loss
#set values for loop
d <- length(input$V1)
res <- c()

for (i in 1:d) {
  if(input[i,1] == "A"){
      res[i] <- ifelse(input[i,2]== "Y", 8, ifelse(input[i,2]== "X", 4, 3))
    } else {
      if(input[i,1] == "B"){
        res[i] <- ifelse(input[i,2]== "Y", 5, ifelse(input[i,2]== "X", 1, 9))
      } else {
        if(input[i,1] == "C"){
        res[i] <- ifelse(input[i,2]== "Y", 2, ifelse(input[i,2]== "X", 7, 6))
      }
    }
  }
}

sum(res)

####################
# part 2
###################

d <- length(input$V1)
res <- c()

for (i in 1:d) {
  if(input[i,1] == "A"){
    res[i] <- ifelse(input[i,2]== "Y", 4, ifelse(input[i,2]== "X", 3, 8))
  } else {
    if(input[i,1] == "B"){
      res[i] <- ifelse(input[i,2]== "Y", 5, ifelse(input[i,2]== "X", 1, 9))
    } else {
      if(input[i,1] == "C"){
        res[i] <- ifelse(input[i,2]== "Y", 6, ifelse(input[i,2]== "X", 2, 7))
      }
    }
  }
}

sum(res)

