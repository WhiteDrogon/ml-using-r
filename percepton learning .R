data(iris3)
subdf <- iris3[1:100, c(1, 3, 5)]
names(subdf) <- c("sepal", "petal", "species")
head(subdf)
library(ggplot2)
ggplot(subdf, aes(x=sepal , y = petal )) +
geom_point(aes(colour = species, shape=species), size =3) +
  xlab("sepal length ") +
  ylab("petal length") +
  ggtitle("Species vs sepal and petal")
subdf[,4] <- -1
subdf[subdf[,3] == "setosa ", 4] <- -1
x<-subdf[,c(1,2)]
y<-subdf[,4]
learning<-function(x,y,eta,niter){
  weight  <-rep(0,dim(x)[2] + 1) # intialising weight as zero dim(x)[2] +1 and calculatinf total number of weights to be added to the neural net
  errors <-rep(0,niter) # intialising errors as zero for n number of iterations
  for(j in 1:niter)
  {
    for(i in 1:length(y)){
      z<-sum(weight[2:length(weight)] * as.numeric(x[i,])) + weight[1]
      if(z < 0){
        ypred <- -1
        
      }
      else {
        ypred <- 1
      }
      different <- eta *(y[i] - ypred) * c(1,as.numeric(x[i,]))
      weight<-weight+different
      if((y[i]-ypred)!=0.0){
        errors[j] <- errors[j] +1
      }
      
    }

  }
  print(weight)
  return(errors)
}
err <- learning(x,y,1,10)

plot(1:10, err, type="l", lwd=2, col="red", xlab="epoch #", ylab="errors")
title("Errors vs epoch - learning rate eta = 1")