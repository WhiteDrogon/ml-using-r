install.packages("ROSE")
library(ROSE)
data(hacide)
#model used here would be a decision tree
install.packages("rpart")
library(rpart)
treeimb <- rpart(cls ~., data = hacide.train)
prediction <- predict(treeimb,newdata = hacide.test)
accuracy.meas(hacide.test$cls,prediction[,2],threshold = 0.2)
#precision - True positives / true positive + false positives
#recall - true positives/true positives / false negatives
#fmeasure - combines precision and recall and tells us about the effectives of classification 
roc.curve(hacide.test$cls , prediction[,2] , plotit = TRUE)
#tells us if a given data set must be classified or not before applying a machine learning algorithm
data_over <- ovun.sample(cls~., hacide.train , method = "over" , N = 1960)$data
data_under <- ovun.sample(cls~.,hacide.train,method = "under" , N=40)$data
table(data_over$cls)
table(data_under$cls)
#perform both over sampling and undersampling
data_both <- ovun.sample(cls~.,hacide.train,method="both",N=1000)$data
table(data_both$cls)
#generation of random samples by using oversampling methods
data.rose <- ROSE(cls ~.,hacide.train,N=1000,p=0.5)$data
table(data.rose$cls)
#build decision tree models to evaluate the models
tree.rose <- rpart(cls~., data = data.rose)
tree.over <- rpart(cls~., data = data_over)
tree.under <- rpart(cls~.,data = data_under)
tree.both <- rpart(cls~., data = data_both)
rose.predic <- predict(tree.rose , newdata = hacide.test)
over.predic <- predict(tree.over , newdata = hacide.test)
under.predic <- predict(tree.under , newdata = hacide.test)
both.predic <-predict(tree.both , newdata = hacide.test)
#measure accuracy using acccuracy.meas and ROC
accuracy.meas(hacide.test$cls,rose.predic[,2],threshold=0.5)
roc.curve(hacide.test$cls,rose.predic[,2],plotit = TRUE) #area under curve 0.981
roc.curve(hacide.test$cls,over.predic[,2],plotit = TRUE) # area under curve 0.798
roc.curve(hacide.test$cls,under.predic[,2],plotit = TRUE)#area under curve 0.920
roc.curve(hacide.test$cls,both.predic[,2],plotit = TRUE)#area under curve 0.798
#AREA UNDER REGION IS MAXIMUM UNDER RANDOM SYNTHETIC GENERATION OF DATA TO PERFORM SAMPLING 
ROSE.eval(cls~.,hacide.test,rpart, acc.measure = "auc",method.assess = "holdout",extr.pred = function(obj)obj[,2],seed=1)