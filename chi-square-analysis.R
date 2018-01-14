#15
#logistic regression for categorical data 
input <- mtcars
am.data<-glm(am~wt+hp+cyl,data=input,family=binomial)
summary(am.data)
lo <- data.frame(wt=1.1,hp=67,cyl=5)
predict(am.data,lo,type="response")
library(MASS)
Cars93
str(Cars93)
#chi square analysis
car.data <- data.frame(Cars93$AirBags,Cars93$Type)
car.data
str(car.data)
# to apply chi square analysis we have to upload the data in the form of a table
car.data <- table(Cars93$AirBags,Cars93$Type)
car.data
print(chisq.test(car.data))
# how to set null hypothesis and alternative hypothesis??
#what exactly does the p value represent 