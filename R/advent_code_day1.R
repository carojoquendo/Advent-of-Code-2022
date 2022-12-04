####################### ADVENT OF CODE DAY 1######################

##################
# PART 1
##################

#read file keeping blank lines
input <- scan("advent1.txt", blank.lines.skip = FALSE)

#substitute NA for 0s
which(input==0) #but first check that there are no 0s within the data frame
space <- which(is.na(input)==TRUE)
input[space] <- 0

#set values for loop
d <- length(input) #number of lines to loop through
res <- c() #create an empty vector to store results
var <- 0 
y <- 1

#loop through each index and add the numbers
#if there is a zero stop counting and record number in results vector res
#reset the counters and continue counting
for (i in 1:d) {
  var <- var + input[i]
    if (input[i] == 0) {
      res[y] <- var
      y <- y+1
      var <- 0
    } 
}

cat ("The elf carrying the most calories is carrying", max(res), "calories")

#####################
# PART 2
#####################
#Find the top three Elves carrying the most Calories. 
#How many Calories are those Elves carrying in total?

#sort results
res_sorted <- sort(res, decreasing = TRUE)

#add up the top three
total <- sum(res_sorted[1:3])

cat("The three elves carrying the most calories are carrying", total, "total calories")
