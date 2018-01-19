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

barChart <- function(data,x_column,y_column=NULL){
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
  if(!is.null(y_column)){
    # Summarising another column for the y axis
    # y has to be numeric to be summarised
    if(is.character(data[[y_column]])|is.factor(data[[y_column]])){
      stop('The y axis needs to be numeric in order to be summarised as a mean of the x_columns. You could use the following columns: ',paste(colnames(data)[which(apply(data,2,is.numeric))],collapse=', '))
    }
    if(y_column==x_column){
      stop('Specify two different columns.')
    }
    # Creating plotting data
    plottingData <- data %>%
      # Converting to factor to ensure x axis is categorical in case of integer
      mutate(x_column=as.factor(.[[x_column]])) %>%
      # Creating Summary Data
      group_by_(.dots='x_column')%>%
      # https://www.r-bloggers.com/dynamic-columnvariable-names-with-dplyr-using-standard-evaluation-functions/
      summarise_('meanVal'=sprintf('mean(%s)',y_column)) %>%
      # Renaming data to the string specified in the arguments
      set_colnames(c(x_column,sprintf('avg%s',y_column)))
    
    plot <- ggplot(plottingData)+
      geom_bar(aes_string(x=x_column,y=sprintf('avg%s',y_column)),stat='identity')
  }else{
    # Using count of x axis as y axis
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
  }
  
  # Returning plot
  return(plot)
}

# Similarly to y_column add the option for a fill_column.

barChart <- function(data,x_column,y_column=NULL,fill_column=NULL){
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
  
  # Fill for a barchart needs to be factor, character, or integer
  if(!is.null(fill_column)){
  if(!(is.character(data[[fill_column]])|is.factor(data[[fill_column]]))){
    # Not a character or factor 
    if(!(length(unique(round(data[[fill_column]])))==length(unique(data[[fill_column]])))){
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
        stop('Bar plots should not be used with a float fill variable. You could use the following columns: ',paste(potential,collapse=', '))
      }
    }
  }
  }
  if(!is.null(y_column)){
    # Summarising another column for the y axis
    # y has to be numeric to be summarised
    if(is.character(data[[y_column]])|is.factor(data[[y_column]])){
      stop('The y axis needs to be numeric in order to be summarised as a mean of the x_columns. You could use the following columns: ',paste(colnames(data)[which(apply(data,2,is.numeric))],collapse=', '))
    }
    if(y_column==x_column){
      stop('Specify two different columns.')
    }
    
    if(!is.null(fill_column)){
      plottingData <- data %>%
        # Converting to factor to ensure x axis is categorical in case of integer
        mutate(x_column=as.factor(.[[x_column]])) %>%
        # Converting to factor to ensure fill is categorical in case of integer
        mutate(fill_column=as.factor(.[[fill_column]])) %>%
        # Creating Summary Data
        group_by_(.dots=c('x_column','fill_column'))%>%
        # https://www.r-bloggers.com/dynamic-columnvariable-names-with-dplyr-using-standard-evaluation-functions/
        summarise_('meanVal'=sprintf('mean(%s)',y_column)) %>%
        # Renaming data to the string specified in the arguments
        set_colnames(c(x_column,fill_column,sprintf('avg%s',y_column)))
      
      plot <- ggplot(plottingData)+
        geom_bar(aes_string(x=x_column,y=sprintf('avg%s',y_column),fill=fill_column),stat='identity')
    }else{
      # Creating plotting data
      plottingData <- data %>%
        # Converting to factor to ensure x axis is categorical in case of integer
        mutate(x_column=as.factor(.[[x_column]])) %>%
        # Creating Summary Data
        group_by_(.dots='x_column')%>%
        # https://www.r-bloggers.com/dynamic-columnvariable-names-with-dplyr-using-standard-evaluation-functions/
        summarise_('meanVal'=sprintf('mean(%s)',y_column)) %>%
        # Renaming data to the string specified in the arguments
        set_colnames(c(x_column,sprintf('avg%s',y_column)))
      
      plot <- ggplot(plottingData)+
        geom_bar(aes_string(x=x_column,y=sprintf('avg%s',y_column)),stat='identity')
    }
  }else{
    
    if(!is.null(fill_column)){
      plottingData <- data %>%
        # Converting to factor to ensure x axis is categorical in case of integer
        mutate(x_column=as.factor(.[[x_column]])) %>%
        # Converting to factor to ensure fill is categorical in case of integer
        mutate(fill_column=as.factor(.[[fill_column]])) %>%
        # Selecting only the x_column and fill_column
        select(x_column,fill_column) %>%
        # Renaming to the strings specified in the arguments
        set_colnames(c(x_column,fill_column))
      
      plot <- ggplot(plottingData)+
        geom_bar(aes_string(x=x_column,fill=fill_column))
    }else{
      # Using count of x axis as y axis
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
    }
    
    
  }
  
  # Returning plot
  return(plot)
}

# Add an argument that will determine whether the barchart is stacked or dodged

barChart <- function(data,x_column,y_column=NULL,fill_column=NULL,position='stack'){
  # Position can only be stack or dodge.
  if(!position%in%c('stack','dodge')){
    stop('Position can only be stack or dodge')
  }
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
  
  if(!is.null(fill_column)){
    if(!(is.character(data[[fill_column]])|is.factor(data[[fill_column]]))){
      # Not a character or factor 
      if(!(length(unique(round(data[[fill_column]])))==length(unique(data[[fill_column]])))){
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
          stop('Bar plots should not be used with a float fill variable. You could use the following columns: ',paste(potential,collapse=', '))
        }
      }
    }
  }
  if(!is.null(y_column)){
    # Summarising another column for the y axis
    # y has to be numeric to be summarised
    if(is.character(data[[y_column]])|is.factor(data[[y_column]])){
      stop('The y axis needs to be numeric in order to be summarised as a mean of the x_columns. You could use the following columns: ',paste(colnames(data)[which(apply(data,2,is.numeric))],collapse=', '))
    }
    if(y_column==x_column){
      stop('Specify two different columns.')
    }
    
    if(!is.null(fill_column)){
      plottingData <- data %>%
        # Converting to factor to ensure x axis is categorical in case of integer
        mutate(x_column=as.factor(.[[x_column]])) %>%
        # Converting to factor to ensure fill is categorical in case of integer
        mutate(fill_column=as.factor(.[[fill_column]])) %>%
        # Creating Summary Data
        group_by_(.dots=c('x_column','fill_column'))%>%
        # https://www.r-bloggers.com/dynamic-columnvariable-names-with-dplyr-using-standard-evaluation-functions/
        summarise_('meanVal'=sprintf('mean(%s)',y_column)) %>%
        # Renaming data to the string specified in the arguments
        set_colnames(c(x_column,fill_column,sprintf('avg%s',y_column)))
      
      plot <- ggplot(plottingData)+
        geom_bar(aes_string(x=x_column,y=sprintf('avg%s',y_column),fill=fill_column),stat='identity',position=position)
    }else{
      # Creating plotting data
      plottingData <- data %>%
        # Converting to factor to ensure x axis is categorical in case of integer
        mutate(x_column=as.factor(.[[x_column]])) %>%
        # Creating Summary Data
        group_by_(.dots='x_column')%>%
        # https://www.r-bloggers.com/dynamic-columnvariable-names-with-dplyr-using-standard-evaluation-functions/
        summarise_('meanVal'=sprintf('mean(%s)',y_column)) %>%
        # Renaming data to the string specified in the arguments
        set_colnames(c(x_column,sprintf('avg%s',y_column)))
      
      plot <- ggplot(plottingData)+
        geom_bar(aes_string(x=x_column,y=sprintf('avg%s',y_column)),stat='identity',position=position)
    }
  }else{
    if(!is.null(fill_column)){
      plottingData <- data %>%
        # Converting to factor to ensure x axis is categorical in case of integer
        mutate(x_column=as.factor(.[[x_column]])) %>%
        # Converting to factor to ensure fill is categorical in case of integer
        mutate(fill_column=as.factor(.[[fill_column]])) %>%
        # Selecting only the x_column and fill_column
        select(x_column,fill_column) %>%
        # Renaming to the strings specified in the arguments
        set_colnames(c(x_column,fill_column))
      
      plot <- ggplot(plottingData)+
        geom_bar(aes_string(x=x_column,fill=fill_column),position=position)
    }else{
      # Using count of x axis as y axis
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
        geom_bar(aes_string(x=x_column),position=position)
    }
  }
  
  # Returning plot
  return(plot)
}

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
