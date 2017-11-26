# You need the tidyverse library for these problems. Run the line of code below.
library(tidyverse)
# If R says "there is no package called ‘tidyverse’" run these lines of code
install.packages('tidyverse');library(tidyverse)
# That error usually means you need to install the library.

# Create a list called "example_list" with elements 'a'= 2*2 and 'b'='Second'
example_list <- list('a'=2*2,
                     'b'='Second')

# Add a third element to "example_list" which contains "mtcars"
example_list[[3]] <- mtcars

# We will be using the inbuilt data frame "iris" in the rest of these problems

# Show the first 6 rows of "iris"
head(iris)

# Find another way to show the first 6 rows of iris.
iris[1:6,]

# Find the column names of "iris"
colnames(iris)

# Calculate the number of each species of iris using the function "table()" and
# the column "Species"
table(iris$Species)

# Convert the data frame "iris" to a tibble called "iris_tibble"
iris_tibble <- as_tibble(iris)

# Using the tidyverse select the columns "Sepal.Length","Sepal.Width" and "Species".
# Store it in a variable called "iris_subsetted"
iris_subsetted <- select(iris_tibble,"Sepal.Length","Sepal.Width", "Species")

# Filter iris_subsetted so we don't see the species 'virginica' and store
# the result in a variable called "iris_filtered"
iris_filtered <- filter(iris_subsetted,Species!='virginica')

# Mutate iris_filtered so there is a new variable called "Sepal.Ratio" which is
# the Length divided by the Width. Store the result in a variable called
# iris_mutated
iris_mutated <- mutate(iris_filtered,'Sepal.Ratio'=Sepal.Length/Sepal.Width)

# Perform the above operations on iris_tibble in one operation. Store this in 
# a variable called iris_piped
iris_piped <- iris_tibble %>%
  select("Sepal.Length","Sepal.Width", "Species") %>% 
  filter(Species!='virginica') %>%
  mutate('Sepal.Ratio'=Sepal.Length/Sepal.Width)

# Create a variable called iris_piped_first_row which selects the first row as
# the last command in the pipe.
iris_piped_first_row <- iris_tibble %>%
  select("Sepal.Length","Sepal.Width", "Species") %>% 
  filter(Species!='virginica') %>%
  mutate('Sepal.Ratio'=Sepal.Length/Sepal.Width) %>%
  .[1,]
