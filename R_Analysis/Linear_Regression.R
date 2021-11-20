#install.packages("tidyverse")
#install.packages("jsonlite")
#install.packages('RPostgreSQL')
#install.packages('caTools')

# Getting the needed libraries
library(RPostgreSQL)
library(ggplot2)
library(caTools)

## Connecting to PostgreSQL database

pg=dbDriver("PostgreSQL")
con = dbConnect(pg, user="postgres", password="LearnProgramming1!",
                host="localhost", port=5432, dbname="group_project")

#listing all the tables available in the PostgreSQL Database 
dbListTables(con)  

# Reading the table of interest seadata
seadata = dbReadTable(con, "seadata")
summary(seadata)

# A look at the data shows us that 2019 values are quite large and may not be within the range
# So we need to check for outliers

# Creating a boxplot to check for outliers
boxplot(seadata)$out

# Assigning the outlier values into a vector
outliers <- boxplot(seadata$north_extent, plot=FALSE)$out

# Finding in which rows the outliers are
seadata[which(seadata$north_extent %in% outliers),]

# Removing the rows containing the outliers
seadata <- seadata[-which(seadata$north_extent %in% outliers),]

# Creating a simple scatterplot 
ggplot(seadata, aes(x=north_extent, y=gmsl_gia)) + 
  geom_point(shape=18, color="blue")

# Calculating the correlation coefficient
cor(seadata$north_extent,seadata$gmsl_gia)

#create linear model
model <- lm(gmsl_gia ~ north_extent,seadata) 

#summarizing the train model
summary (model) 

#plotting scatter and linear model
ggplot(seadata, aes(x=north_extent, y=gmsl_gia)) + 
  geom_point(shape=18, color="blue")+
  geom_smooth(method=lm, se=FALSE, linetype="dashed",
              color="darkred")
