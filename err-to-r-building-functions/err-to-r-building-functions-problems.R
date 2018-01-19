# In the post we created this function. We are now going to iterate this and build upon its functionality
barChart <- function(data,x_column){
  # This function creates a count bar chart with a factor, character, or integer x axis
  if(!(is.character(data[[x_column]])|is.factor(data[[x_column]]))){
    # Not a character or factor 
    if(!(length(unique(round(data[[x_column]])))==length(unique(data[[x_column]])))){
      # Column is a float
      potential <- character()
      # Identifying valid columns
      for(col in colnames(data)){
        if(is.character(data[[col]])|is.factor(data[[col]])){
          potential[length(potential)+1] <- col
        }else if(length(unique(round(data[[col]])))==length(unique(data[[col]]))){
          potential[length(potential)+1] <- col
        }
        # Terminating function with suggested columns
        stop('Bar plots should not be used with a float x axis. You could use the following columns: ',paste(potential,collapse=', '))
      }
    }
  }
  # Creating plotting data
  plottingData <- data %>%
    # Converting to factor to ensure x axis is categorical in case of integer
    mutate(x_column=as.factor(.[[x_column]])) %>%
    # Selecting only the x_column as dplyr has created data[['x_column']]
    select(x_column)%>%
    # Renaming data[['x_column']] to the string specified in the arguments
    set_colnames(x_column)
  # Creating plot
  plot <- ggplot(plottingData)+
    geom_bar(aes_string(x=x_column))
  # Returning plot
  return(plot)
}

# Using a default arguement of y_column=NULL, and !is.null(y_column), build the functionality to build a
# barchart with a summarised y axis. Like we did in the visualisation post the summary function will be the mean.
# You will need to find a solution to how we use variables within group_by and summarise. Hint using group_by_ and summarise_.
# ggplot(barplotData)+
#   geom_bar(aes(x=as.factor(cyl),y=avgMPG),stat='identity')

# Similarly to y_column add the option for a fill_column.

# Add an argument that will determine whether the barchart is stacked or dodged


# By the end your function should be able to handle these calls with either plots or user defined error messages
barChart(data=mtcars,x_column='cyl')
barChart(data=iris,x_column='Species',y_column='Sepal.Width')
barChart(data=mtcars,x_column='cyl',y_column='hp')
barChart(data=mtcars,x_column='cyl',y_column='hp',fill='carb')
barChart(data=mtcars,x_column='cyl',fill='carb')
barChart(data=mtcars,x_column='cyl',fill='carb',position='dode')
barChart(data=mtcars,x_column='cyl',fill='carb',position='dodge')
barChart(data=mtcars,x_column='cyl',y_column='disp',position='dodge')
barChart(data=mtcars,x_column='cyl',y_column='hp',fill='carb',position='dodge')
