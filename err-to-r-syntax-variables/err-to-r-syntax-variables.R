
## What is Syntax?
# Comments need to be on one line
# otherwise we will get a syntax error. As you can see below.
# Comments need to be on one line
multi line comments need multiple comment symbols
# otherwise we will get a syntax error. As you can see below.

## Variables
my_first_variable <- 'Hello, World!' # This is a bit of a coding cliché :)

### Viewing variables
my_first_variable
print(my_first_variable)
value <- 2
2*value
ls()
rm(value)
ls()

### Numeric
egVar1 <- 2
class(egVar1)

### Logical
egVar2 <- TRUE
class(egVar2)
class(NA)

### NULL
class(NULL)

### Character
egVar3 <- 'This is a character variable, also referred to as a string'
class(egVar3)

### Vector
egVar4 <- c(egVar1,egVar2,egVar3)
print(egVar4)
class(egVar4[1]);class(egVar4[2]);class(egVar4[3])
egVar4[3]
egVar4[3] <- 'This is a character variable, also referred to as a string - Within a vector'
egVar4

### Factor
egVar5 <- factor(c('Hello World','Factors are different to strings'))
class(egVar5)
egVar5
egVar5[1] <- 'Change this'
egVar5
