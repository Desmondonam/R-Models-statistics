## get the packages that we are working with. 
library(wordcloud)
library(e1071)
library(gmodels)
library("twitteR")
library("ROAuth")
library("dplyr")
library("tidytext")

## Get the data that we are working with

# Chnage the names of the columns

my_data <- read.delim("D:/Obita/21123456D/Assignment_Data/Q2/train_tweets_new.txt")
head(my_data)
colnames(my_data)[colnames(my_data)=="X264183816548130816"] <- "tweetID"
colnames(my_data)[colnames(my_data)=="X15140428"] <- "userID"
colnames(my_data)[colnames(my_data)=="positive"] <- "Sentiment"
colnames(my_data)[colnames(my_data)=="                                                                                 Gas.by.my.house.hit..3.39.....I.m.going.to.Chapel.Hill.on.Sat....
"] <- "text"

# 2. Explore an external tokenizer 




head(my_data)
# convert tweets to df
df <- twListToDF(my_data)
# text cleaning
df$text <- as.character(df$text)
df$text <- gsub("\\$", "", df$text) 
df$text <- gsub("@\\w+", "", df$text)
df$text <- gsub("[[:punct:]]","", df$text)
df$text <- gsub("http\\w+", "", df$text)
df$text <- gsub("[ |\t]{2,}", "", df$text)
df$text <- gsub("^ ", "", df$text)
df$text <- gsub(" $", "", df$text)
df$text <- gsub("RT","",df$text)
df$text <- gsub("href", "", df$text)
df$text <- gsub("([0-9])","", df$text)










