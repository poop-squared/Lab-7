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
Book2 =data.frame(matrix(ncol = 3, nrow = 4))
names(Book2) = c("Y","X1","X2")
Book2[1,] = c(2.1,2,4)
Book2[2,] = c (18.5,7,3)
Book2[3,] = c (2,1,2)
Book2[4,] = c (15,8,6)

attach(Book2)

Book2$Y = as.numeric(Book2$Y)
Book2$X1 = as.numeric(Book2$X1)
Book2$X2 = as.numeric(Book2$X2)

mytree2 = rpart(Book2$Y ~ Book2$X1 + Book2$X2, control = rpart.control(cp = 0.01))
rpart.plot(mytree2)
summary(mytree2)

mytree2$cptable[which.min(mytree2$cptable[, "xerror"]),"CP"]
min(mytree2$cptable[, "xerror"])