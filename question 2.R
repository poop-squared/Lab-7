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