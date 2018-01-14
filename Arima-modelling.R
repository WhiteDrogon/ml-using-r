# time series analysis and prediction 
# we used the inbuilt data set Air passengers
plot(AirPassengers)
abline(reg=lm(AirPassengers~time(AirPassengers)))
#general trend data
plot(aggregate(AirPassengers,FUN=mean))
start(AirPassengers)
end(AirPassengers)
summary(AirPassengers)
frequency(AirPassengers)
# to find out months vs air passengers in 11 years
boxplot(AirPassengers~cycle(AirPassengers))
#convert the time series to a stationery model 
#apply the log function then it makes the variance equal
plot(diff(log(AirPassengers)))
library(tseries)
acf(AirPassengers)
#ARIMA MODELLING 
# AR I MA 
#p d q
acf(diff(log(AirPassengers))) # used to calculate q

pacf(diff(log(AirPassengers))) # detreminse the values of p

plot(diff(log(AirPassengers)))

# the value of d is determined by the number of differentiations performed 

fit <- arima(log(AirPassengers),c(0,1,1),seasonal = list(order=c(0,1,1),period=12))
pred <- predict(fit,n.ahead=10*12)
predicted <- 2.718^pred$pred
predicted
pred
#plot the predicted value as well 
ts.plot(AirPassengers,2.718^pred$pred,log="y",lty=c(1,3))
# test the model 
datawide <- ts(AirPassengers,frequency = 12 , start=c(1949,1),end=c(1959,12))
fit <- arima(log(AirPassengers),c(0,1,1),seasonal = list(order = c(0,1,1),period = 12))
pred <- predict(fit,n.ahead = 10*12)
predicted <- 2.718^pred$pred
data1 <- head(predicted,12)
predicted19 <- round(data1,digits=0)
origianl <- tail(AirPassengers,12)
ts.plot(AirPassengers,2.718^pred$pred,log="y",lty=c(1,3))



