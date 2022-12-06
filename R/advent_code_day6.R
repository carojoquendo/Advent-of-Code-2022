######################## DAY 5 ###############################

##############
# PART 1
##############
#read input as a single line
input <- readLines("Data/advent6.txt",n = 1 )

#split characters into a vector of letters
datastream <- unlist(strsplit(input, split = ""))

#set variables 
marker <- "continue"

#set counter
i <- 1

while(marker == "continue") {
  if(datastream[i] != datastream[(i+1)] && datastream[i] != datastream[(i+2)] && datastream[i] != datastream[(i+3)]){
    if(datastream[(i+1)] != datastream[(i+2)] && datastream[(i+1)] != datastream[(i+3)]){
      if(datastream[(i+2)] != datastream[(i+3)]){
        marker <- "stop"
      }
    } 
  }
  i <- i+1
}

cat((i+2), "characters need to be processed")

##############
# part 2
##############

#set variables 
marker <- "continue"

#set counter
i <- 1
#realised I could make de loop more efficient
while (marker == "continue") {
  if (length(unique(sort(datastream[i:(i+13)]))) == 14){
    marker <- "stop"
  }
  i <- i+1
}

cat((i+12), "characters need to be processed")
