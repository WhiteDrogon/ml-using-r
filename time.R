data("AirPassengers")
class(AirPassengers)
#to depict start of time series and end of time series  
start(AirPassengers)
end(AirPassengers)
plot(AirPassengers)
abline(reg=lm(AirPassengers~time(AirPassengers)))
cycle(AirPassengers)
plot(aggregate(AirPassengers,FUN = mean),ylab = "mean function")
