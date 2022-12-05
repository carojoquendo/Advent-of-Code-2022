######################## DAY 5 ###############################

##############
# PART 1
##############

#read input
input <- read.delim("Data/advent5.txt", 
                    header=FALSE, 
                    blank.lines.skip = FALSE, 
                    na.strings=FALSE, allowEscapes = FALSE)

#find the white space to split up data
blank <- which(nchar(input[,1])== 0)

#separate the crate input by characters
crates <- strsplit(input$V1[1:(blank-2)], "")

stack1 <- c()
stack2 <- c()
stack3 <- c()
stack4 <- c()
stack5 <- c()
stack6 <- c()
stack7 <- c()
stack8 <- c()
stack9 <- c()

for (i in 8:1){
  stack1 <- c(stack1, crates[[i]][2])
  stack2 <- c(stack2, crates[[i]][6])
  stack3 <- c(stack3, crates[[i]][10])
  stack4 <- c(stack4, crates[[i]][14])
  stack5 <- c(stack5, crates[[i]][18])
  stack6 <- c(stack6, crates[[i]][22])
  stack7 <- c(stack7, crates[[i]][26])
  stack8 <- c(stack8, crates[[i]][30])
  stack9 <- c(stack9, crates[[i]][34])
}

#remove empty strings
stack1 <- stack1[which(stack1 %in% LETTERS)]
stack2 <- stack2[which(stack2 %in% LETTERS)]
stack3 <- stack3[which(stack3 %in% LETTERS)]
stack4 <- stack4[which(stack4 %in% LETTERS)]
stack5 <- stack5[which(stack5 %in% LETTERS)]
stack6 <- stack6[which(stack6 %in% LETTERS)]
stack7 <- stack7[which(stack7 %in% LETTERS)]
stack8 <- stack8[which(stack8 %in% LETTERS)]
stack9 <- stack9[which(stack9 %in% LETTERS)]


#read only the crate info 
#crates <- as.data.frame(str_split_fixed(trimws(read_lines("Data/test.txt", n_max = blank-2)), " ", n=3))

#Read moving directions
directions <- str_split_fixed(trimws(read_lines("Data/advent5.txt", skip = blank, n_max = nrow(input))), " ", n=6)

stacks <- list(stack1, stack2, stack3, stack4, stack5, stack6, stack7, stack8, stack9)

#number of directions
dir <- nrow(directions)

for (i in 1:dir){
    move <- as.numeric(directions[i,2])
    from <- as.numeric(directions[i,4])
    to <- as.numeric(directions[i,6])
    
    while (move > 0){
      last_element <- length(stacks[[from]])
      stacks[[to]] <- c(stacks[[to]], stacks[[from]][last_element])
      stacks[[from]] <- stacks[[from]][-last_element]
      move <- move-1
    }
 }

last_stack1 <- stacks[[1]][length(stacks[[1]])]
last_stack2 <- stacks[[2]][length(stacks[[2]])]
last_stack3 <- stacks[[3]][length(stacks[[3]])]
last_stack4 <- stacks[[4]][length(stacks[[4]])]
last_stack5 <- stacks[[5]][length(stacks[[5]])]
last_stack6 <- stacks[[6]][length(stacks[[6]])]
last_stack7 <- stacks[[7]][length(stacks[[7]])]
last_stack8 <- stacks[[8]][length(stacks[[8]])]
last_stack9 <- stacks[[9]][length(stacks[[9]])]

solution <- paste(last_stack1, last_stack2, last_stack3, last_stack4, last_stack5, last_stack6, last_stack7, last_stack8, last_stack9)
paste("The crates that end up on top of each stack are", gsub(" ", "", solution))

##############
# part 2
##############

stacks <- list(stack1, stack2, stack3, stack4, stack5, stack6, stack7, stack8, stack9)

#number of directions
dir <- nrow(directions)

for (i in 1:dir){
  move <- as.numeric(directions[i,2])
  from <- as.numeric(directions[i,4])
  to <- as.numeric(directions[i,6])
  last_element <- length(stacks[[from]])
  cut_from <- (last_element-move)+1
  stacks[[to]] <- c(stacks[[to]], stacks[[from]][cut_from:last_element])
  stacks[[from]] <- stacks[[from]][-(cut_from:last_element)]
}

last_stack1 <- stacks[[1]][length(stacks[[1]])]
last_stack2 <- stacks[[2]][length(stacks[[2]])]
last_stack3 <- stacks[[3]][length(stacks[[3]])]
last_stack4 <- stacks[[4]][length(stacks[[4]])]
last_stack5 <- stacks[[5]][length(stacks[[5]])]
last_stack6 <- stacks[[6]][length(stacks[[6]])]
last_stack7 <- stacks[[7]][length(stacks[[7]])]
last_stack8 <- stacks[[8]][length(stacks[[8]])]
last_stack9 <- stacks[[9]][length(stacks[[9]])]

solution <- paste(last_stack1, last_stack2, last_stack3, last_stack4, last_stack5, last_stack6, last_stack7, last_stack8, last_stack9)
paste("The crates that end up on top of each stack are", gsub(" ", "", solution))
