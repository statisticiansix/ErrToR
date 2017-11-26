
## While
i <- 1
while(i < 10){
  print(i)
  i <- i+1 # If we didn't increase i then we would get an infinite loop.
}
i <- 1
j <- 7
while(i < 3){
  while(j > 5){
    print(i*j)
    j <- j-1
  }
  i <- i+1
  j <- 7
}

## Repeat
i <- 1
repeat{
  if(i>5){
    stop('Too big')
  }
  print(i)
  i <- i+1
}

### Break
i <- 1
repeat{
  if(i>5){
    break
  }
  print(i)
  i <- i+1
}

## For
for (i in 1:5){
  print(i)
}
for(variableName in vector){
  CODE
}

### Next
for (number in 1:5){ # We can call our variable name anything
  if(number%%2==0){ # and use it throughout the loop
    next
  }
  print(number)
}
'number'%in%ls() # It then exists in the environment
number <- 1
repeat{
  if(number>5){
    break
  }else if(number%%2==0){
    number <- number+1
  }else{
    print(number)
    number <- number+1
  }
}

### Storing values in a loop
out1 <- c()
out2 <- c()
for (number in 1:5){
  if(number%%2==0){
    next
  }
  out1 <- c(out1,number)
  out2[length(out2)+1] <- number
}
