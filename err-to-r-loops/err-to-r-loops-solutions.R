outWhile <- c()
outRepeat <- c()
outFor <- c()
# Leave the proc.time() statements where they are and build your loops between them
a <- proc.time()
# Build a while loop that calculate the multiple of i*(i-1), i = 2:10000000. Store the values in outWhile.
# Don't worry about the size of the vector, it is a simple operation and won't overly strain your computer.
i <- 2
while(i <= 10000000){
  outWhile[length(outWhile)+1] <- i*(i-1)
  i <- i+1
}

b <- proc.time()
# Do the same with a repeat loop but going from 10000000:2, and store the values in outRepeat
i=10000000
repeat{
  if(i<2){
    break
  }
  outRepeat[length(outRepeat)+1] <- i*(i-1)
  i <- i-1
}
c <- proc.time()
# One more time using a for loop, but call the variable "number".
for(number in 2:10000000){
  outFor[length(outFor)+1] <- i*(i-1)
}
d <- proc.time()
# Select from here to the start of your code and run all in one block. 
# If you used "a <- c(a,new)" to assign new value it will take a fair amount of time. Try the other method shown.
repeatTime <- (c-b)[3];repeatTime
whileTime <- (b-a)[3];whileTime
forTime <- (d-c)[3];forTime

# Run it a couple of times and what you should start to notice is a pattern with which loop is faster.

# This set of problems is fairly boring, because we use loops as part of a process. 

# To make it slightly more interesting let us look at an example from the previous section.
# ########
# # if(i < 5){
# #   if(j < 5){
# #     print('i and j are small')
# #   }else{
# #     print('i is small and j is large')
# #   }
# # }else{
# #   if(j < 5){
# #     print('i is large and j is small')
# #   }else{
# #     print('i and j are large')
# #   }
# # }
# ########
# Turn the conditional above into a nested for loop: i = j = 1:5
for (i in 1:5){
  for(j in 1:5){
    if(i < 5){
      if(j < 5){
        print('i and j are small')
      }else{
        print('i is small and j is large')
      }
    }else{
      if(j < 5){
        print('i is large and j is small')
      }else{
        print('i and j are large')
      }
    }
  }
}

# There are times when we cannot avoid using loops, so we will be using them quite frequently.
# Make sure you are comfortable using them.