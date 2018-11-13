### Question 1

attach(election)

# Part B
names(election)
attach(election)
mytree = tree(winner ~ percent_bachelor + percent_hispanic)

plot(election$percent_bachelor, election$percent_hispanic, pch=1, xlab="% Bachelor",ylab="Hispanic", 
     col = ifelse(election$winner == "Trump", "red", "blue"))
partition.tree(mytree,ordvars=c("percent_bachelor","percent_hispanic"),add=TRUE)
legend ("topright",pch =1, legend = c("Trump","Clinton"), col = c("red","blue"))

# Part C
View(Book2)
attach(Book2)

Book2$ï..Y = as.numeric(Book2$ï..Y)
Book2$X1 = as.numeric(Book2$X1)
Book2$X2 = as.numeric(Book2$X2)

mytree2 = rpart(Book2$ï..Y ~ Book2$X2 + Book2$X2, control = rpart.control(cp = 0.01))
rpart.plot(mytree2)
summary(mytree2)

mytree2$cptable[which.min(mytree2$cptable[, "xerror"]),"CP"]
min(mytree2$cptable[, "xerror"])