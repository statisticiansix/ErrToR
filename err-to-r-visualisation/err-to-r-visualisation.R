
### Vanilla vs. Tidyverse
plottingData <- mtcars %>%
  as_tibble %>% 
  mutate(`Car Names`=rownames(.))

### ggplot
ggplot()
basePlot <- ggplot()
class(basePlot)

##
## Scatterplot
basePlot + 
  geom_point(data=plottingData,aes(x=mpg,y=hp))
basePlot + 
  geom_point(data=plottingData,aes(x=mpg,y=hp,colour='green'))
basePlot + 
  geom_point(data=plottingData,aes(x=mpg,y=hp,colour=green))
basePlot + 
  geom_point(data=plottingData,aes(x=mpg,y=hp),colour='green')
basePlot + 
  geom_point(data=plottingData,aes(x=mpg,y=hp),colour='#BD0026')
basePlot + 
  geom_point(data=plottingData,aes(x=mpg,y=hp,size=disp,colour=wt,shape=as.factor(cyl)))

##
### Layering
basePlot + 
  geom_point(data=plottingData,aes(x=mpg,y=hp,size=disp),stroke=1,fill='green',colour='black',pch=21)+
  geom_vline(data=plottingData,aes(xintercept=mean(mpg)))+
  geom_hline(data=plottingData,aes(yintercept=mean(hp)))
basePlot + 
  geom_vline(data=plottingData,aes(xintercept=mean(mpg)))+
  geom_hline(data=plottingData,aes(yintercept=mean(hp)))+
  geom_point(data=plottingData,aes(x=mpg,y=hp,size=disp),stroke=1,fill='green',colour='black',pch=21)
ggplot(data=plottingData)+ 
  geom_vline(aes(xintercept=mean(mpg)))+
  geom_hline(aes(yintercept=mean(hp)))+
  geom_point(aes(x=mpg,y=hp,size=disp),stroke=1,fill='green',colour='black',pch=21)

##
### Primary Plotting Characters
pchData <- tibble(x=rep(1:5,5),y=sort(rep(1:5,5))) %>% mutate(pch=1:n())
ggplot(pchData)+
  geom_point(aes(x=x,y=y),fill='green',colour='black',size=2,pch=1:25)+
  geom_text(aes(x=x,y=y,label=pch),nudge_x = -0.2)+
  theme_void()

##
## Histogram
ggplot(data=plottingData)+
  geom_histogram(aes(x=mpg))
ggplot(data=plottingData)+
  geom_histogram(aes(x=mpg),binwidth=4)
ggplot(data=plottingData)+
  geom_histogram(aes(x=mpg),fill='#BD0026',colour='black',bins=5)

##
## Barplot
ggplot(plottingData)+
  geom_bar(aes(x=as.factor(cyl)))

##
### dplyr: group_by
plottingData %>%
  group_by(cyl) %>%
  mutate(avgMPG=mean(mpg)) %>%
  select(cyl,mpg,avgMPG) %>%
  head
plottingData %>%
  group_by(cyl) %>%
  mutate(avgMPG=mean(mpg),
         location=1:n())%>%
  filter(location==1)%>%
  select(cyl,avgMPG) 

##
### dplyr: summarise
plottingData %>%
  group_by(cyl) %>%
  summarise('avgMPG'=mean(mpg))
barplotData <- plottingData %>%
  group_by(cyl) %>%
  summarise('avgMPG'=mean(mpg))
ggplot(barplotData)+
  geom_bar(aes(x=as.factor(cyl),y=avgMPG))
ggplot(barplotData)+
  geom_bar(aes(x=as.factor(cyl),y=avgMPG),stat='identity')
barplotData <- plottingData %>%
  group_by(cyl,gear) %>%
  summarise('avgMPG'=mean(mpg))
ggplot(barplotData)+
  geom_bar(aes(x=as.factor(cyl),y=avgMPG,fill=as.factor(gear)),stat='identity')
ggplot(barplotData)+
  geom_bar(aes(x=as.factor(cyl),y=avgMPG,fill=as.factor(gear)),stat='identity',position='dodge')

##
## Data structure
spread(barplotData,gear,avgMPG,fill=0)

##
### dplyr: spread
spread(DATA,COLUMN,VALUES)
tableData <- barplotData %>%
  spread(gear,avgMPG,fill=0)

##
### dplyr: gather
gather(`KEY COLUMN NAME`,`VALUE COLUMN NAME`,COLUMNS)
tidied <- tableData %>%
  gather('gear','avgMPG',2:4)
tidied <- tableData %>%
  gather('gear','avgMPG',-1)
tidied
tidiedGraph <- ggplot(tidied)+
  geom_bar(aes(x=as.factor(cyl),y=avgMPG,fill=as.factor(gear)),stat='identity',position='dodge')
tidiedGraph

### Interactive Plots
library(plotly)
library(rbokeh)

##
## Plotly
ggplotly(tidiedGraph)

##
## rbokeh
bokehPlot <- figure(tidied) %>%
  ly_bar(x=as.factor(cyl),y=avgMPG,color=as.factor(gear),position='dodge',hover=TRUE)
bokehPlot
