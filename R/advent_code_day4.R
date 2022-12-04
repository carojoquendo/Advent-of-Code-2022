######################## DAY 4 ###############################

##############
# PART 1
##############

#read input
input <- read.delim("advent4.txt", sep=",", header=FALSE)

#set values for loop
d <- nrow(input)
sum <- 0

for (i in 1:d){
  elf1 <- unlist(strsplit(input[i,1], "-"))
  elf2 <- unlist(strsplit(input[i,2], "-"))
  
  elf1_seq <- seq(from=elf1[1], to=elf1[2])
  elf2_seq <- seq(from=elf2[1], to=elf2[2])
  
  length_elf1 <- length(elf1_seq)
  length_elf2 <- length(elf2_seq)
  
  length_overlap <- length(which(elf1_seq %in% elf2_seq))
  
  if(length_overlap != 0) {
    if((length_overlap == length_elf1 || length_overlap == length_elf2)){
      sum <- sum+1
    }
  }
}

paste(sum , "assignment pairs fully contain the other one") 

#############
# part 2
#############

#set values for loop
d <- nrow(input)
sum <- 0

for (i in 1:d){
  elf1 <- unlist(strsplit(input[i,1], "-"))
  elf2 <- unlist(strsplit(input[i,2], "-"))
  
  elf1_seq <- seq(from=elf1[1], to=elf1[2])
  elf2_seq <- seq(from=elf2[1], to=elf2[2])
  
  length_elf1 <- length(elf1_seq)
  length_elf2 <- length(elf2_seq)
  
  length_overlap <- length(which(elf1_seq %in% elf2_seq))
  
  if(length_overlap != 0) {
    sum <- sum+1
  }
}

paste(sum , "assignment pairs overlap") 

