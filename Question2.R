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


library(tm) 
library(SnowballC) 
corpus = VCorpus(VectorSource(datas$text)) 
corpus = tm_map(corpus, content_transformer(tolower)) 
corpus = tm_map(corpus, removeNumbers) 
corpus = tm_map(corpus, removePunctuation) 
corpus = tm_map(corpus, removeWords, stopwords("english")) 
corpus = tm_map(corpus, stemDocument) 
corpus = tm_map(corpus, stripWhitespace) as.character(corpus[[1]])




#As naive bayes algorithm excepts binary 
convert <- function(x) {
  y <- ifelse(x > 0, 1,0)
  y <- factor(y, levels=c(0,1), labels=c("No", "Yes"))
  y
}  

datanaive = apply(dtm, 2, convert)

dataset = as.data.frame(as.matrix(datanaive))    
dataset$Class = datas$sentiment
str(dataset$Class)

set.seed(31)
split = sample(2,nrow(dataset),prob = c(0.75,0.25),replace = TRUE)
train_set = dataset[split == 1,]
test_set = dataset[split == 2,] 

prop.table(table(train_set$Class))
prop.table(table(test_set$Class))

# naive bayes
install.packages("e1071")
library(e1071)
library(caret)
control= trainControl(method="repeatedcv", number=10, repeats=2)
system.time( classifier_nb <- naiveBayes(train_set, train_set$Class, laplace = 1,trControl = control,tuneLength = 7) )


# model evaluation

nb_pred = predict(classifier_nb, type = 'class', newdata =  test_set)
confusionMatrix(nb_pred,test_set$Class)






