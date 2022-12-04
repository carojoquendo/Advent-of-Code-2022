######################## DAY 3 ###############################

##############
# PART 1
##############

#read input
input <- read.delim("advent3.txt", sep="", header=FALSE)

#create a key to find value for letter
letters <- as.data.frame(c(letters[seq(from=1,to=26),1], LETTERS[seq(from=1,to=26)]))
value <- as.data.frame(seq(from=1, to=52))
key <- cbind(letters, value)
colnames(key) <- c("letter", "value")

#get number of rows
d <- nrow(input)
sum <- 0

for (i in 1:d){
  rucksack <- unlist(strsplit(input[i,1], "", perl=TRUE))
  chars <- nchar(input[i,1]) #count number of characters within first line
  split <- chars/2 #divide by two to split compartments
 
  comp1 <- rucksack[1:split]  # create a vector for each compartment
  comp2 <- rucksack[(split+1):chars]
  
  repeated <- unique(comp1[which(comp1 %in% comp2)]) #find repeated letter
  sum <- sum + key[which(key$letter==repeated),2] # add the value of the letter to the total
}

paste("The sum of the priorities is", sum) 

##############
# PART 2
##############
input <- read.delim("test.txt", sep="", header=FALSE)
#get number of rows
d <- nrow(input)

sum <- 0
sequence <- seq(from=1, to=d, by=3)

for (i in sequence) {
  rucksack1 <- unlist(strsplit(input[i,1], "", perl=TRUE))
  rucksack2 <- unlist(strsplit(input[i+1,1], "", perl=TRUE))
  rucksack3 <- unlist(strsplit(input[i+2,1], "", perl=TRUE))
  
  repeat1 <- unique(rucksack1[which(rucksack1 %in% rucksack2)]) 
  repeat2 <- unique(repeat1[which(repeat1 %in% rucksack3)])
  
  sum <- sum + key[which(key$letter==repeat2),2]
}

paste("The sum of the priorities is", sum) 

