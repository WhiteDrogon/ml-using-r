data("Pima.te")
data <- Pima.te
library(caTools)
training$type <- ifelse(training$type=="No",0,1)
testing$type <- ifelse(testing$type=="No",0,1)
split <- sample.split(data,SplitRatio = 0.8)
training <- subset(data,split == "TRUE")
testing <- subset(data, split=="FALSE")
model <- glm(type~.,training,family = "binomial")
summary(model)
#aic value should go down and residual deviance value should go down if you remove an independent variable from the data frame
answer <- predict(model,testing,type="response")
answer
#optimize the model
#create a confusion matrix 
(table(actualvalue=training$type,predictedvalue=answer>0.5))
#use the roc curve that can be used to calculate the threshold to determine the number of false positives and minimize the error
library(ROCR)
res <- predict(model,training,type="response")
ROCPred <- prediction(res,training$type)
ROCPref <- performance(ROCPred,"tpr","fpr")
plot(ROCPref,colorize=TRUE,print.cutoffs.at=seq(0.1,by=0.1))

