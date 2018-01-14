#14 
#one-testing phasing
a = c(65,78,88,55,48,95,66,57,79,91)
t.test(a,mu=75)
b = c(80,90,80,90)
t.test(b,mu=85)
data("sleep")
View(sleep)
t.test(extra~group,sleep)
sleep_wide <- data.frame(
  ID=1:10,
  group1=sleep$extra[1:10],
  group2=sleep$extra[11:20])
t.test(sleep_wide$group1,sleep_wide$group2)
#student t-test
t.test(extra~group , sleep , var.equal=TRUE)
# more than two samples t testin - anova 
data("PlantGrowth")
library(MASS)
library(ggplot2)
# carry out anova
one_way_anova <- aov(weight~group , PlantGrowth)
one_way_anova
summary(one_way_anova)
#anova helps us find out the difference in mean among different groups present in the data
#to determine best ggroup use post-hoc test
TukeyHSD(one_way_anova)
#Paired t test 
t.test(extra~group , sleep , paired = TRUE)







