#importing packages
library("ggplot2")
library("readxl")
#install.packages("ggExtra")
library(ggExtra)
library(dplyr)
library(scales)
library(ggplot2)
#install.packages("ggrepel")
library(ggrepel)

#line chart with ggplot

df<-read_excel('world-population.xlsm')
head(df)
line_plot<-ggplot(df, aes(x = Year, y=Population))+geom_line(colour='orange', size = 1)
line_plot+ggtitle("\nWORLD POPULATION\n")+labs(x = '\nYear', y = 'Population\n')+
  theme_bw()+  removeGrid()+
  expand_limits(y = c(0,7000000000)) +
  xlim(1960, 2009)+
  scale_y_continuous(labels = scales::label_number_si(), breaks = scales::pretty_breaks(n = 8))+
  #eliminating gridlines, and chart border
  theme(panel.border = element_blank(), axis.ticks.y = element_blank(),axis.ticks.x = element_blank(),axis.text=element_text(size=10),  axis.title.y=element_text(size=14), axis.title.x=element_text(size=14)) +
  #draws x and y axis line
  theme(axis.line = element_line(color = 'gray'))

#step chart with ggplot

df1<-read_excel('Inflation.xlsx')
head(df1)
df1
df1$Month = factor(df1$Month, levels = month.abb)
PltData <- subset(df1, Month=="Jan"| Month =='May'| Month =='Aug')
PltData
ggplot() + 
  geom_step(data=df1,mapping=aes(x=Month,y=Year_2020, group =1),
            linetype=1,color='orange', size = 1.2) + 
  #geom_point(data=PltData,mapping=(aes(x=Month,y=Year_2020)))+
  geom_text_repel(data=PltData,mapping=(aes(x=Month,y=Year_2020)),label = PltData$Year_2020,
                  size = 3.55)+
  geom_text_repel()+
  ggtitle("\nINFLATION IN 2020\n")+
  labs(x = '\nMonth', y = 'Inflation (%)\n')+
  theme_bw()+  removeGrid()+
  theme(panel.border = element_blank(), axis.ticks.y = element_blank(), axis.ticks.x = element_blank(),axis.text=element_text(size=11),axis.text.x = element_text(size = 10), axis.text.y = element_text(size = 10),  axis.title.y=element_text(size=14), axis.title.x=element_text(size=14))+
  theme(axis.line = element_line(color = 'gray'))

  
