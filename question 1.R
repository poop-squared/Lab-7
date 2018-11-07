### Question 1

attach(election)

##1b

g1 = ggplot(aes(percent_bachelor/100,percent_hispanic, color= winner))

g1 + geom_point()

plot(percent_bachelor/100, percent_hispanic)

str(election)
