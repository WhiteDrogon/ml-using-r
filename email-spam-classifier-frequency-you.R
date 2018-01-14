library(kernlab)
data("spam")
head(spam)
#based on frequency of you 
plot(density(spam$you[spam$type=="nonspam"]),col="blue",main="",xlab="Frequency of 'your'")
lines(density(spam$you[spam$type=="spam"]),col="red")
#find a frequency where if the value is greater than frequency it is apm
abline(v=0.5,col="black")
prediction <- ifelse(spam$you>2 , "spam" , "nonspam")
table(prediction,spam$type)/length(spam$type)