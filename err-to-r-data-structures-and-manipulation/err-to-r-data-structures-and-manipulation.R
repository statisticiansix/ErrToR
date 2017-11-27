
## Data frames
library(knitr)
library(tidyverse)
knitr::kable(head(mtcars))
mtcars$mpg
mtcars$mpg[1:6]
colnames(mtcars)

### List 1
# Select
# Define
list1 <- list('a'=2,
              'b'=sample(1:10,5))
list1$a
list1$b
list1$c <- 'Manual'
# Select
list1[[1]]

# Define
list1[[3]] <- 'Changed Value'
list1[['named']] <- 'Another Value'
list1
length(list1)
names(list1)

### List 2
list2 <- split(mtcars,mtcars$cyl)

##
## cyl=4
knitr::kable(list2$`4`)

##
## cyl=6
knitr::kable(list2$`6`)

##
## cyl=8
# Vanilla vs. Tidyverse
knitr::kable(list2$`8`)

## Tibbles
# Data manipulation
as_tibble(mtcars)

### Vanilla
# Vector
# Data Frame
# Vector
c(1,2,3)[1:2]
# Data Frame
mtcars[1:2,] # Row
mtcars[,1:2] # Column
mtcars[1,2] # Both

## Tidyverse: dplyr
mtcars_tibble <- as_tibble(mtcars)

## Extract
VERB(DATA,COMMAND)

### Select
selected <- select(mtcars_tibble,c(mpg,cyl,carb))
`column name`
data$`column name`

### Filter
filtered <- filter(selected,carb==4,cyl==6)
knitr::kable(filtered)
orFilter <- filter(selected,carb==4|cyl==6)
knitr::kable(orFilter)

##
## Pipes
filtered2 <- filter(select(mtcars_tibble,c(mpg,cyl,carb)),carb==4,cyl==6)
piped <- mtcars_tibble %>%
  select(c(mpg,cyl,carb))%>%
  filter(carb==4,cyl==6)
piped

##
## %>% .
piped %>% .[1,2]

### Mutate
mtcars_tibble <- mtcars_tibble %>% 
  mutate(`Car Names`=rownames(.))
piped <- mtcars_tibble %>%
  select(c(`Car Names`,mpg,cyl,carb))%>%
  filter(carb==4,cyl==6)
knitr::kable(piped)
piped <- mtcars_tibble %>%
  select(c(`Car Names`,mpg,cyl,carb))%>%
  filter(carb==4,cyl==6) %>%
  mutate(`log mpg`=log(mpg))
knitr::kable(piped)
