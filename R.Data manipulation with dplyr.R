
### Data manipulation with dplyr ###

#This package is part of the “tidyverse”, a set of packages that facilitate 
#data cleaning and manipulation.

#Libraries 
library(tidyverse)
library(dplyr)

#data is the vector where the dataset to be analyzed is stored.
#For excel file you need library(readxl)and the file upload will look like: 
#data<-read_xlsx("x.xlsx").

data=read.csv("x.csv",header = TRUE,fill = TRUE)

#It is important tocheck that the dataset does not contain missing data 
#that would alter the tests, for this we will first check the data set: 

colSums(is.na(data))

#For atypical data:

boxplot(data$column, main="Boxplot for Atypical Detection")
atypcal=boxplot.stats(data$column)$out
print(atypcal)

#Pipe operator
#The pipe operator %>% takes the result of the expression to its left and 
#passes it as the first argument of the function to its right. 

data %>% sqrt(data) %>% log(data)

#Filter 
#This function is used to filter rows in a data frame that meet 
#certain conditions.

data_filtered=data %>%
  filter(column < x) 
print(data_filtered)

#Select
#Allows to select a set of columns from the data frame.

data_selected=data %>%
  select(column1,column2)
print(data_selected)

#Mutate
#Used to add new columns that are functions of existing columns.

data_mutated=data %>%
  mutate(data_dvi=column1/colum2)
print(data_mutated)

#Arrange
#Used to sort the rows of a data frame by one or more columns.

data_arranged= data %>%
  arrange(column)
print(data_arranged)

#summarise
#Used to create a statistical summary of different variables, which may 
#include the mean, median, sum, etc.

data_mean= data %>%
  summarise(
    mean=mean(column)
  )
print(data_mean)

#group by
#Used to group columns that meet a certain condition.

data_grouped=data %>%
  group_by(column)
print(data_grouped)
    
### Example ###

data("iris")

#Filter

iris_filtered=iris %>%
  filter(Sepal.Length > 6)
print(iris_filtered)

#Select

iris_selected=iris %>%
  select(Sepal.Length,Sepal.Width)
print(iris_selected)

#Mutate

iris_mutate=iris %>%
  mutate(
    Sepal_data=Sepal.Length/Sepal.Width,
    Petal_data=Petal.Length/Petal.Width
    )
print(iris_mutate)

#Arrange
#Descendant
iris_aranged_desc=iris %>%
  arrange(desc(Sepal.Length))
print(iris_aranged_desc)

#Ascendant
iris_arranged=iris %>%
  arrange(Sepal.Width)
print(iris_arranged)

#Combination
iris_arranged_combined=iris %>%
  arrange(Sepal.Length,desc(Sepal.Width))
print(iris_arranged_combined)

#Summarise

iris_mean=iris %>% 
  summarise(
    mean=mean(Petal.Width),
    SD=sd(Petal.Width),
    median=median(Petal.Width)
    )
print(iris_mean)

#Group by

iris_grup=iris %>% 
  group_by(Species) 
print(iris_grup)

iris_grup=iris %>% 
  group_by(Species) %>% 
  summarise(
    mean=mean(Petal.Width),
            SD=Petal.Width,
            median=median(Petal.Width)
    )
print(iris_grup,n=150)


usethis::create_github_token() 
gitcreds::gitcreds_set()

