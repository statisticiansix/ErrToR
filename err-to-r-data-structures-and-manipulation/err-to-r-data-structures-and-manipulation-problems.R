# You need the tidyverse library for these problems. Run the line of code below.
library(tidyverse)
# If R says "there is no package called ‘tidyverse’" run these lines of code
install.packages('tidyverse');library(tidyverse)
# That error usually means you need to install the library.

# Create a list called "example_list" with elements 'a'= 2*2 and 'b'='Second'

# Add a third element to "example_list" which contains "mtcars"

# We will be using the inbuilt data frame "iris" in the rest of these problems

# Show the first 6 rows of "iris"

# Find another way to show the first 6 rows of iris.

# Find the column names of "iris"

# Calculate the number of each species of iris using the function "table()" and
# the column "Species"

# Convert the data frame "iris" to a tibble called "iris_tibble"

# Using the tidyverse select the columns "Sepal.Length","Sepal.Width" and "Species".
# Store it in a variable called "iris_subsetted"

# Filter iris_subsetted so we don't see the species 'virginica' and store
# the result in a variable called "iris_filtered"

# Mutate iris_filtered so there is a new variable called "Sepal.Ratio" which is
# the Length divided by the Width. Store the result in a variable called
# iris_mutated

# Perform the above operations on iris_tibble in one operation. Store this in 
# a variable called iris_piped

# Create a variable called iris_piped_first_row which selects the first row as
# the last command in the pipe.

