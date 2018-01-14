#15
#multiple regression 
input <- mtcars
print(head(input))
library(Hmisc)
rcorr(as.matrix(mtcars),type="pearson")
model <- lm(mpg~wt+disp+hp,data = input)
print(model)
cat("Printing the model-multiple regressionype=","\n")
a <- coef(model)[1]
b <- coef(model)[2]
c <- coef(model)[3]
d <- coef(model)[4]
newdata <- data.frame(disp=221,hp=102,wt=2.91)
prediction <- predict(model,newdata,type="response")
prediction
