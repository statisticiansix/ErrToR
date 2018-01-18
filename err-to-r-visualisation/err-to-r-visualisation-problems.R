library(tidyverse)
## Let us use an adapted version of the data frame iris throughout this post's problems
iris_piped <- iris %>%
  as_tibble %>%
  mutate('Sepal.Ratio'=Sepal.Length/Sepal.Width,
         'Petal.Ratio'=Petal.Length/Petal.Width)

# Create a scatter plot of Sepal.Length vs. Sepal.Width

# Colour the points using the Species of iris

# Increase the size of the points

# Change the plotting character to one with a fill and colour

# Make the border (stroke) of the plotting character thicker

# Make the border (stroke) of the plotting character thicker

# Challenges ----

# We have not covered these points in the post, however they are straightforward to solve and you should
# be able to find answers.

# Challenge #1 ----

# There are multiple points on top of another. 
# Find a way to jitter the points so that we can see all the data in the plot.
# Hint. If you google "jitter points in ggplot2" you will find the answer

# Add a title to the plot

# Rename the axis titles to remove the full stop between

# Change the look of the plot using themes (http://ggplot2.tidyverse.org/reference/ggtheme.html)

# Change the location of the legend from the right hand side to the bottom

# Challenge #2 ----

# Given we are talking about flowers let us create a petal plot - a circular bar chart. 

# 1) Summarise a data frame to show the average Sepal Length, Sepal Width, Petal Length and Petal Width per Species

# 2) Gather into columns called 'Measurement' and 'Value' so we can plot with ggplot

# 3) Create a dodged bar chart showing the average Sepal Length, Sepal Width, Petal Length and Petal Width per Species

# 4) Change the axes from cartesian coordinates to polar coordinates. (This is similar to the way in which we would create a pie chart)

# Bonus Step: It might look better if we had a plot with multiple "facets" to show each species.



