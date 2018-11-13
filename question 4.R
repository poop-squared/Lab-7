### Question 4 ###
attach(election)
View(election)
names(election)

#part b prediction using 10,000 tree forest
q4.random.forest.10000 = randomForest(winner ~ county_population_2014+ population_change+ 
                                  percent_under_5+ percent_over_65+ percent_female+ 
                                  percent_black+ percent_hispanic+ median_household_income+ 
                                  percent_bachelor,
                                ntree=10000, data=election, importance=TRUE)
#install.packages("modelr")   #moved to library code page
#library(modelr) # moved to library code page


election4b = add_predictions(election,q4.random.forest.10000, var ="Predicted_Winner" )
detach(election)
attach(election4b)

plot_usmap(regions = "counties", data = election4b, values = "Predicted_Winner", lines = NA) + 
  labs(title = "US Counties 4B", subtitle = "Predicted Map with 10,000 random trees") + 
  theme(panel.background = element_rect(colour = "black", fill = "lightblue")) +
  ggplot2::aes(col = ifelse("Predicted_winner" == "Trump", "dark red","dark blue"))

#part C prediction using 10 tree forest

q4.random.forest.10 = randomForest(winner ~ county_population_2014+ population_change+ 
                                        percent_under_5+ percent_over_65+ percent_female+ 
                                        percent_black+ percent_hispanic+ median_household_income+ 
                                        percent_bachelor,
                                      ntree=10, data=election, importance=TRUE)
election4c = add_predictions(election,q4.random.forest.10, var ="Predicted_Winner" )
detach(election4b)
attach(election4c)

plot_usmap(regions = "counties", data = election4c, values = "Predicted_Winner", lines = NA) + 
  labs(title = "US Counties 4C", subtitle = "Predicted Map with 10 random trees") + 
  theme(panel.background = element_rect(colour = "black", fill = "lightblue")) +
  ggplot2::aes(col = ifelse("Predicted_winner" == "Trump", "dark red","dark blue"))

#part d Actual winners
plot_usmap(regions = "counties", data = election, values = "winner", lines = NA) + 
  labs(title = "US Counties 4D", subtitle = "Actual Winners") + 
  theme(panel.background = element_rect(colour = "black", fill = "lightblue")) +
  ggplot2::aes(col = ifelse("Predicted_winner" == "Trump", "dark red","dark blue"))
