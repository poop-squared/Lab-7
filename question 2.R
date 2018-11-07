####Question 2 ####

tree.q2a = rpart(winner~ county_population_2014+ population_change+ 
                   percent_under_5+ percent_over_65+ percent_female+ 
                   percent_black+ percent_hispanic+ median_household_income+ 
                   percent_bachelor,
                 control = rpart.control(cp = 0.2))
rpart.plot(tree.q2a)
summary(tree.q2a)

tree.q2b = rpart(winner~ county_population_2014+ population_change+ 
                   percent_under_5+ percent_over_65+ percent_female+ 
                   percent_black+ percent_hispanic+ median_household_income+ 
                   percent_bachelor,
                 control = rpart.control(cp = 0.05))
rpart.plot(tree.q2b)
summary(tree.q2b)

tree.q2c = rpart(winner~ county_population_2014+ population_change+ 
                   percent_under_5+ percent_over_65+ percent_female+ 
                   percent_black+ percent_hispanic+ median_household_income+ 
                   percent_bachelor,
                 control = rpart.control(cp = 0.001))
rpart.plot(tree.q2c)
summary(tree.q2c)

plotcp(tree.q2c)

#2f

tree.q2f  = rpart(winner~ county_population_2014+ population_change+ 
                              percent_under_5+ percent_over_65+ percent_female+ 
                              percent_black+ percent_hispanic+ median_household_income+ 
                              percent_bachelor,
                            control = rpart.control(cp = 0.00000000000000001))


plotcp(tree.q2f)
#identify optimal cp
best_cp = tree.q2f$cptable[which.min(tree.q2f$cptable[,"xerror"]),"CP"]
best_cp

tree.optimal =  rpart(winner~ county_population_2014+ population_change+ 
                        percent_under_5+ percent_over_65+ percent_female+ 
                        percent_black+ percent_hispanic+ median_household_income+ 
                        percent_bachelor,
                      control = rpart.control(cp = best_cp))
plotcp(tree.optimal)

rpart.plot(tree.optimal)
