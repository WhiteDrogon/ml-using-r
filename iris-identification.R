# working with iris with tutorial - 1st data science project
data("iris")
df <- iris
percentage <-prop.table(table(df$Species))*100
cbind(freq=table(df$Species),percentage=percentage)
#split into training and testing
library(caTools)
split <- sample.split(df,SplitRatio = 0.8)
train1 <- subset(df,split==TRUE)
test <- subset(df,split==FALSE)
summary(train)
summary(test)
par(mfrow = c(1,4))
boxplot(train$Sepal.Length)
boxplot(train$Sepal.Width)
boxplot(train$Petal.Length)
boxplot(train$Petal.Width)
#petal length and petal width are way higher
featurePlot(x=train[1:4],y=train[,5],plot="ellipse")
featurePlot(x=train[1:4],y=train[,5],plot="box")
#density plots
scales <- list(x=list(relation="free"),y=list(relation="free"))
featurePlot(x=iris[1:4],y=iris[,5],plot="density",scales=scales)

control <- trainControl(method = "cv",number = 10)
metric <- "Accuracy"
fit.lda <- train(Species~.,data = train1,method = "lda",metric=metric,trcontrol = control)
set.seed(7)
fit.tree <- train(Species~., data=train1,method="rpart",metric=metric,trcontrol=control)
fit.knn <- train(Species~., data=train1,method="knn",metric=metric,trcontrol = control)
fit.rf <- train(Species~., data=train1,method="rf",metric=metric, trcontrol=control)
results <- resamples(list(lda=fit.lda, rf=fit.rf))
summary(results)
dotplot(results)
predictions <- predict(fit.lda,test)
confusionMatrix(predictions,test$Species)
