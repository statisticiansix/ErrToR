# The line below generates a random number between 1 and 10.
number <- sample(1:10,1)
# Get R to find out if the value is even
# Hint: we do this using the modulo operator, the statment should be (number%%2==0)
number%%2==0
# Write a conditional that prints 'Even Number' or 'Odd Number' depending upon the
# value of 'number'
if(number%%2==0){
  print('Even Number')
}else{
  print('Odd Number')
}
# Write a conditional that evaluates the conditional code block if the first statement
# is FALSE
if(number%%2!=0){
  print('Odd Number')
}else{
  print('Even Number')
}
# Create a conditional block that will check first to see if the number is prime, returing
# 'Prime' if true, before checking if the number is odd or even.
# Hint: you will require a vector of primes up to 10 and the %in% operator
if(number %in% c(1,2,3,5,7)){
  print('Prime Number')
}else if(number%%2==0){
  print('Even Number')
}else{
  print('Odd Number')
}
# Nest a conditional that checks if the number is greater than or equal to 5. If so return
# 'Large Odd Number', 'Small Odd Number' etc.
if(number %in% c(1,2,3,5,7)){
  if(number>=5){
    print('Large Prime Number')
  }else{
    print('Small Prime Number')
  }
}else if(number%%2==0){
  if(number>=5){
    print('Large Even Number')
  }else{
    print('Small Even Number')
  }
}else{
  if(number>=5){
    print('Large Odd Number')
  }else{
    print('Small Odd Number')
  }
}
# Un-nest the above conditional as we should only nest if we are evaluating different
# variables from the "parent" conditional
if((number %in% c(1,2,3,5,7)) & (number>=5)){
  print('Large Prime Number')
}else if((number %in% c(1,2,3,5,7)) & !(number>=5)){
  print('Small Prime Number')
}else if(number%%2==0 & (number>=5)){
  print('Large Even Number')
}else if(number%%2==0 & !(number>=5)){
  print('Small Even Number')
}else if(number%%2!=0 & (number>=5)){
  print('Large Odd Number')
}else{
  print('Small Odd Number')
}
number
