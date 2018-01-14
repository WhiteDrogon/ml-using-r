#ELBOW METHOD ON TWO DATA SETS  1. USArrests 2.attitude
install.packages("factoextra")
install.packages("NbClulst")
library(factoextra)
library(NbClust)
df <- USArrests
df1 <- attitude
fviz_nbclust(df , kmeans , method = "wss") + geom_line(xintercept = 4 , linetype = 2) + labs(subtitle = "Elbow method")
fviz_nbclust(df1, kmeans , method = "wss") + geom_line(xintercept = 4 , linetype = 2) + labs(subtitle = "Elbow method for a different dataset")