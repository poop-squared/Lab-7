### Data Frame ####

election = read.csv("election_2016.csv")
attach(election)

####Libraries####
install.packages("tree")
install.packages("rpart.plot")
install.packages("randomForest")
library(randomForest)
library(tree)
library(rpart)
library(rpart.plot)