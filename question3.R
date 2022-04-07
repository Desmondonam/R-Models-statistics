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
glimpse(data)

summary(data)

# Implementing the K-means algorithm



# function to compute total within-cluster sum of square 
wss <- function(k) {
  kmeans(df, k, nstart = 10 )$tot.withinss
}

# Compute and plot wss for k = 1 to k = 15
k.values <- 1:15

# extract wss for 2-15 clusters
wss_values <- map_dbl(k.values, wss)

plot(k.values, wss_values,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

kmean <- kmeans(data, 2)
kmean$centers











