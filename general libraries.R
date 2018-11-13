### Data Frame ####

election = read.csv("election_2016.csv")
attach(election)

####Libraries####
install.packages("tree")
install.packages("rpart.plot")
install.packages("randomForest")
install.packages("modelr")
install.packages("usmap")
library(usmap)
library(modelr)
library(randomForest)
library(tree)
library(rpart)
library(rpart.plot)
library(ggplot2)
