# Load the libraries that are needed for the model
# Loading package
library(ClusterR)
library(cluster)
library("ggplot2")
library("dplyr")
library("ggfortify")





## get the data that we are to use in the implementation of this model

# Loading data
data <- read.delim("D:/Obita/21123456D/Assignment_Data/Q3/points.txt")
head(data)


# Structure 
str(data)
