setwd("~/Downloads")
df <- read.csv("timeseries_ppi.csv")
head(df)
par(mfrow=c(1,1))
plot(df$ppi,type="l")
plot(df$dppi,type="l")
acf(ppi)
pacf(ppi)
plot(acf(df$ppi))
plot(pacf(df$dppi))
library(tseries)
y <- df$ppi
d.y <- df$dppi
t <- df$yearqrt

plot(t,y)
plot(t,d.y)

#test for stationery - dicky fuller test 
adf.test(y,alternative="stationary",k=0)
adf.test(y,alternative="explosive",k=0)
#hence the data is not stationery null hypothesis  < 0.05

summary(lm(dppi~lppi,data = df,na.action=na.omit))
summary(lm(dppi~lppi+trend,data=df,na.action = na.omit))

acf(y)
pacf(y)

acf(d.y,na.action = na.omit)
pacf(d.y,na.action = na.omit)

arima(y,order = c(1,0,0))
arima(y,order = c(2,0,0))
arima(y,order = c(0,0,1))
arima(y,order = c(1,0,1))
arima(d.y,order = c(1,0,0))
arima(d.y,order = c(0,0,1))
arima(d.y,order = c(1,0,1))
arima(d.y,order = c(1,0,3))
arima(d.y,order = c(2,0,3))


arimamodel <- arima(y,order = c(1,0,1))
arimapredict <- predict(arimamodel,n.ahead=100)
plot(y)
lines(arimapredict$pred,col="blue")

arimamodel2 <- arima(d.y,order = c(1,0,1))
d.y <- na.omit(d.y)
arimapredict2 <- predict(arimamodel2,n.ahead=100)
plot(y)
lines(arimapredict2$pred,col="blue")
