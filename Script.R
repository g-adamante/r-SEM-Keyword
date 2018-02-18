  
# Find most frequent terms on a dataset


#sets working directory
setwd("C:/RKeywords/x")

#imports library
library(tm)
library(SnowballC)
library(readr)

#imports dataset
dataset = read.csv("C:/RKeywords/mergeme/master.csv")
docs = Corpus(DataframeSource(dataset)) 

Encoding(freqTerms)  <- "UTF-8"


# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, content_transformer(removeNumbers))
# Remove portuguese common stopwords
docs <- tm_map(docs, removeWords, stopwords("portuguese"))
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Stemming Text
stemming = tm_map(docs, stemDocument)
# Making a Term-Document Matrix
dtm <- DocumentTermMatrix(stemming)

# Finding frequent terms
freqTerms = findFreqTerms(dtm, 5)

# Write a CSV with the result
write.csv(freqTermsUTF, file="freqTermsUTF.csv")
