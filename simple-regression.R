data("mtcars")
split <- sample.split(mtcars, SplitRatio = 0.7)
split
training <- subset(mtcars , split == TRUE)
test <- subset(mtcars , split == FALSE)
# logistic regression 
# specify equation , dataset working on and the family as parameters of arguments
model <- glm(vs ~ wt+disp , training, family = "binomial")
summary(model)
View(test)
data <- data.frame(wt=3.125,disp = 258)
answer <- predict(model,data,type="response")
answer
data1 <- data.frame(wt=3.190,disp=146.7)
answer1 <- predict(model,data1,type="response")