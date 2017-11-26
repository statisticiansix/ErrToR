value <- 2
### if
class(value)=='character'
if(class(value)=='character'){
  print('The value is a character')
}

### else
if(class(value)=='character'){
  print(value)
}else{
  print(class(value))
}

### else if
i <- 3
if(i < 5){
  print('Less than 5')
}else if(i==3){
  print('The number 3')
}else{
  print('Some other number')
}

### Nested conditionals
if(i < 5){
  if(i == 3){
    print('The number 3')
  }else{
    print('Less than 5 but not equal to 3')
  }
}else{
  print('Some other number')
}
i <- 3
j <- 10
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
