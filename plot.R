11th class - 13/12/2017 - hours - plotting data
#pie chart
x <- c(21,62,10,53)
labels <- c("london","new york","sing","mumbai")
pie(x,labels)
pie(x,labels,main="city pie chart" , col = rainbow(length(x)))
percent <- round(100*x/sum(x),1)
pie(x,labels= percent , main="pie chart" , col = rainbow(length(x)))
legend("topleft",c("london","new york","sing","mumbai"),cex=0.8,fill=rainbow(length(x)))
#save file externally 
dev.off()
#hist
hist(x,xlab="one",ylab="two",col="red",border = "blue",xlim=c(0,100),ylim = c(0,100)) 

BARCHART
h<-c(7,12,28,3,41)
m<-c("m","a","b","c","d")
barplot(h,names.arg = m,xlab="month",ylab="revenue",col="blue",main="barplot")

LINE CHART 
plot(h,type="o",col="red",xlab = "a",ylab = "m",main="a")
lines(x,type="o",col="blue")

library(RColorBrewer)
data("VADeaths")
par(mfrow=c(2,3))
#display multiple plots on the same page
library(ggplot2)
mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),labels=c("3gears","4gears","5gears"))
mtcars$am <- factor(mtcars$am,levels=c(0,1),labels=c("Automatic","Manual"))
mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8),labels=c("4","6","8"))
#area plot or kernel density
#including alpba makes the graph transparent 
qplot(mpg,data=mtcars,geom="density",fill=gear,alpha=I(.75),main="gas mileage",xlab="mpg",ylab="density")
#regression on qplot
qplot(mpg,wt,data=mtcars,method="lm",geom=c("point","smooth"),formula = y~x,color=cyl,main="regression",xlab="weigth",ylab="miles per gallon")



