
### Normality analysis and data transformation ###

# Normality tests are statistical methods used to determine whether a data set 
# conforms to a normal distribution, which is crucial for validating the assumptions 
# of numerous statistical techniques and data analysis.

#data is the vector where the dataset to be analyzed is stored.
#For excel file you need library(readxl)and the file upload will look like: 
#data<-read_xlsx("x.xlsx").

data<-read.csv("x.csv",header = TRUE,fill = TRUE)

#It is important tocheck that the dataset does not contain missing data 
#that would alter the tests, for this we will first check the data set: 

colSums(is.na(data))

#For atypical data:

boxplot(data$column, main="Boxplot for Atypical Detection")
atypcal<-boxplot.stats(data$column)$out
print(atypcal)

#Test: Shapiro-Wilk
#Less effective with large samples (n > 50)
#Range: The value W varies between 0 and 1 (close to normal distribution).

shapiro_result<-shapiro.test(data$column)
print(shapiro_result)

#Test: Kolmogorov-Smirnov with Lilliefors correction
#Useful when the parameters of the distribution are not known and you have moderate sample sizes.
#Range: The value D varies between 0 and 1 (far from a normal distribution).

require(nortest)
lillie_result<-lillie.test(data$column)
print(lillie_result)

#Test: Jarque-Bera
#Best suited for large data sets, as its power increases with sample size.
#Range: The value of JB can be from 0 to infinity (the higher the value far from a normal distribution).

require(moments)
jarque_result<-jarque.test(data$column)
print(jarque_result) 

### Data transformation ###

# Data transformations are statistical techniques used to modify non-normal data 
# to more closely fit a normal distribution.

#Johnson´s transformation 
#Ideal for cases where data has zero or negative values.
#For this transformation you need to have installed on your R the package Johnson. 

require(Johnson)
johnson_transformed<-RE.Johnson(data$column) 
johnson_transformed<-johnson_transformed$transformed 
print(johnson_transformed)

#Logarithmic transformation
#When data are all positive and have a right skew. 
#+1 to handle zeros if they exist

data$column_log<- log10(data$column+1)
print(data$column_log)

#Square root transformation
#Suitable for count data or in situations where the logarithm is too strong of a transformation.

data$column_sqrt<-sqrt(data$column)
print(data$column_sqrt)

#It is important to visualize your data before and after the transformation!
#You can use the following graph to see the difference between the untransformed 
#data (blue) and transformed data (red).

library(ggplot2)
ggplot(data) +
  geom_histogram(aes(x = column), bins = 30, fill = "blue", alpha = 0.3, label = "Original") +
  geom_histogram(aes(x = column_transformed), bins = 30, fill = "red", alpha = 0.3, label = "Transformed") +
  labs(title = "Comparison of Original vs Transformed Data",
       x = "Values",
       y = "Density")


 
