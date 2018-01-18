library(tidyverse)
## Let us use an adapted version of the data frame iris throughout this post's problems
iris_piped <- iris %>%
  as_tibble %>%
  mutate('Sepal.Ratio'=Sepal.Length/Sepal.Width,
         'Petal.Ratio'=Petal.Length/Petal.Width)

# Create a scatter plot of Sepal.Length vs. Sepal.Width
ggplot(iris_piped)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width))

# Colour the points using the Species of iris
ggplot(iris_piped)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width,colour=Species))

# Increase the size of the points
ggplot(iris_piped)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width,colour=Species),size=3)

# Change the plotting character to one with a fill and colour
ggplot(iris_piped)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width,fill=Species),pch=22,size=3)

# Make the border (stroke) of the plotting character thicker
ggplot(iris_piped)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width,fill=Species),pch=22,size=3,stroke=2)

# Make the border (stroke) of the plotting character thicker
ggplot(iris_piped)+
  geom_point(aes(x=Sepal.Length,y=Sepal.Width,fill=Species),pch=22,size=3,stroke=2)

# Challenges ----

# We have not covered these points in the post, however they are straightforward to solve and you should
# be able to find answers.

# Challenge #1 ----

# There are multiple points on top of another. 
# Find a way to jitter the points so that we can see all the data in the plot.
# Hint. If you google "jitter points in ggplot2" you will find the answer
ggplot(iris_piped)+
  geom_jitter(aes(x=Sepal.Length,y=Sepal.Width,fill=Species),pch=22,size=3,stroke=2)

# Add a title to the plot
ggplot(iris_piped)+
  geom_jitter(aes(x=Sepal.Length,y=Sepal.Width,fill=Species),pch=22,size=3,stroke=2)+
  ggtitle('Plot of Iris Sepal Length vs Width by Species')

# Rename the axis titles to remove the full stop between
ggplot(iris_piped)+
  geom_jitter(aes(x=Sepal.Length,y=Sepal.Width,fill=Species),pch=22,size=3,stroke=2)+
  ggtitle('Plot of Iris Sepal Length vs Width by Species')+
  xlab('Sepal Length')+
  ylab('Sepal Width')

# Change the look of the plot using themes (http://ggplot2.tidyverse.org/reference/ggtheme.html)
ggplot(iris_piped)+
  geom_jitter(aes(x=Sepal.Length,y=Sepal.Width,fill=Species),pch=22,size=3,stroke=2)+
  ggtitle('Plot of Iris Sepal Length vs Width by Species')+
  xlab('Sepal Length')+
  ylab('Sepal Width')+
  theme_dark()

# Change the location of the legend from the right hand side to the bottom
ggplot(iris_piped)+
  geom_jitter(aes(x=Sepal.Length,y=Sepal.Width,fill=Species),pch=22,size=3,stroke=2)+
  ggtitle('Plot of Iris Sepal Length vs Width by Species')+
  xlab('Sepal Length')+
  ylab('Sepal Width')+
  theme_dark()+
  theme(legend.position='bottom')

# Challenge #2----
# Given we are talking about flowers let us create a petal plot - a circular bar chart. The steps are as follows

# 1) Summarise a data frame to show the average Sepal Length, Sepal Width, Petal Length and Petal Width per Species
irisSummarised <- iris %>%
  group_by(Species) %>%
  summarise(Sepal.Length=mean(Sepal.Length),
            Sepal.Width=mean(Sepal.Width),
            Petal.Length=mean(Petal.Length),
            Petal.Width=mean(Petal.Width))
# 2) Gather into columns called 'Measurement' and 'Value' so we can plot with ggplot
irisGathered <- irisSummarised %>%
  gather('Measurement','Value',-1)
# 3) Create a dodged bar chart showing the average Sepal Length, Sepal Width, Petal Length and Petal Width per Species
irisBar <- ggplot(irisGathered)+
  geom_bar(aes(x=Measurement,y=Value,fill=Species),stat='identity',position='dodge')
# 4) Change the axes from cartesian coordinates to polar coordinates. (This is similar to the way in which we would create a pie chart)
irisPetal <- irisBar+
  coord_polar()
# Bonus Step: It might look better if we had a plot with multiple "facets" to show each species.
irisFaceted <- ggplot(irisGathered)+
  geom_bar(aes(x=Measurement,y=Value,fill=Species),stat='identity',position='dodge')+
  coord_polar()+
  facet_wrap(~Species)


