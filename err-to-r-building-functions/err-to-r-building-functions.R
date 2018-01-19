
## Building a function
FUNCTION_NAME <- function(ARGUMENTS){
  CODE
}
FUNCTION_NAME <- function(ARGUMENTS){
  CODE
  return(VALUE)
}
value <- 2
2*value
my_first_func <- function(x){
  y <- 2*x
  return(y)
}
my_first_func(value)
ls()
'y'%in%ls()
class(my_first_func)

### Argument values
func <- function(x=1,y=2){
  val <- x*y
  return(val)
}
func()
func(y=3)
func(y <- 4)
func <- function(x=1,y<-2){
  val <- x*y
  return(val)
}

##
## Order in evaluation
pipeFunc <- function(w=4,x,y,z){
  val <- w*x+y*z
  print(paste('w,x,y,z=c(',w,',',x,',',y,',',z,')',sep=''))
  return(val)
}
5 %>%
pipeFunc(w=2,x=3,z=5)

pipeFunc(1,2,3)
pipeFixed <- function(x,y,z,w=4){
  val <- w*x+y*z
  print(paste('w,x,y,z=c(',w,',',x,',',y,',',z,')',sep=''))
  return(val)
}
pipeFixed(1,2,3)

### Global parameters within functions
func <- function(y){
  return(y*value)
}
func(3)
func <- function(y,value){
  return(y*value)
}
func(3)
func(value=2,y=2)

### mtBarChart
mtcars_tibble <- as_tibble(mtcars)
target <- ggplot(mtcars_tibble)+
  geom_bar(aes(x=as.factor(cyl)))
target
x_column <- 'cyl'
ggplot(mtcars_tibble)+
  geom_bar(aes(x=x_column))
x_column <- 'cyl'
ggplot(mtcars_tibble)+
  geom_bar(aes_string(x=x_column))
x_column <- 'cyl'
plottingData <- mtcars_tibble %>%
  mutate(x_column=as.factor(.[[x_column]]))
x_column <- 'cyl'
plottingData <- mtcars_tibble %>%
  mutate(x_column=as.factor(.[[x_column]])) %>%
  select(x_column)%>%
  set_colnames(x_column)

ggplot(plottingData)+
  geom_bar(aes_string(x=x_column))
mtBarChart <- function(x_column){
  plottingData <- mtcars_tibble %>%
  mutate(x_column=as.factor(.[[x_column]])) %>%
  select(x_column)%>%
  set_colnames(x_column)

 plot <- ggplot(plottingData)+
  geom_bar(aes_string(x=x_column))
 return(plot)
}
mtBarChart('cyl')
mtBarChart('disp')
length(unique(round(column)))==length(unique(column))
mtBarChart <- function(x_column){
  if(length(unique(round(mtcars_tibble[[x_column]])))==length(unique(mtcars_tibble[[x_column]]))){
      plottingData <- mtcars_tibble %>%
        mutate(x_column=as.factor(.[[x_column]])) %>%
        select(x_column)%>%
        set_colnames(x_column)
      
      plot <- ggplot(plottingData)+
        geom_bar(aes_string(x=x_column))
      return(plot)
  }else{
    stop('Bar plots should not be used with a float x axis')
  }
}
mtBarChart('cyl')
mtBarChart('disp')
mtBarChart <- function(x_column){
  if(length(unique(round(mtcars_tibble[[x_column]])))==length(unique(mtcars_tibble[[x_column]]))){
      plottingData <- mtcars_tibble %>%
        mutate(x_column=as.factor(.[[x_column]])) %>%
        select(x_column)%>%
        set_colnames(x_column)
      
      plot <- ggplot(plottingData)+
        geom_bar(aes_string(x=x_column))
      return(plot)
  }else{
    potential <- character()
    for(col in colnames(mtcars_tibble)){
      if(is.character(mtcars_tibble[[col]])|is.factor(mtcars_tibble[[col]])|length(unique(round(mtcars_tibble[[col]])))==length(unique(mtcars_tibble[[col]]))){
        potential[length(potential)+1] <- col
      }
    }
    stop('Bar plots should not be used with a float x axis. You could use the following columns: ',paste(potential,collapse=', '))
  }
}
mtBarChart('disp')
barChart <- function(data,x_column){
  if(length(unique(round(data[[x_column]])))==length(unique(data[[x_column]]))){
    plottingData <- data %>%
      mutate(x_column=as.factor(.[[x_column]])) %>%
      select(x_column)%>%
      set_colnames(x_column)
    
    plot <- ggplot(plottingData)+
      geom_bar(aes_string(x=x_column))
    return(plot)
  }else{
    potential <- character()
    for(col in colnames(data)){
      if(is.character(data[[col]])|is.factor(data[[col]])|length(unique(round(data[[col]])))==length(unique(data[[col]]))){
        potential[length(potential)+1] <- col
      }
    }
    stop('Bar plots should not be used with a float x axis. You could use the following columns: ',paste(potential,collapse=', '))
  }
}
barChart(mtcars,'cyl')
barChart(iris,'Species')
if(!CHARACTER|!FACTOR){
  if(FLOAT){
    ERROR
  }
}
barChart <- function(data,x_column){
  if(!(is.character(data[[x_column]])|is.factor(data[[x_column]]))){
      if(!(length(unique(round(data[[x_column]])))==length(unique(data[[x_column]])))){
        potential <- character()
          for(col in colnames(data)){
            if(is.character(data[[col]])|is.factor(data[[col]])){
              potential[length(potential)+1] <- col
            }else if(length(unique(round(data[[col]])))==length(unique(data[[col]]))){
              potential[length(potential)+1] <- col
            }
        stop('Bar plots should not be used with a float x axis. You could use the following columns: ',paste(potential,collapse=', '))
      }
    }
  }
  plottingData <- data %>%
      mutate(x_column=as.factor(.[[x_column]])) %>%
      select(x_column)%>%
      set_colnames(x_column)
    
    plot <- ggplot(plottingData)+
      geom_bar(aes_string(x=x_column))
    return(plot)
}
barChart(iris,'Species')
barChart(mtcars,'cyl')
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
