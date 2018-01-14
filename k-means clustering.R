library(datasets)
head(attitude)
summary(attitude)
dat <-attitude[,c(3,4)]
plot(dat , main = "Priveldges vs Learning" col = "Dark Red" , pch =20 , cex = 2)
set.seed(7)
kmn <- kmeans(dat, 2 , nstart = 20)
kmn
plot(dat , col = (kmn$cluster +1) , main = "Clustering with 2 Clusters", pch =20, cex=2)
# clusters with 6 clusters - considered optimal using the elbow method
set.seed(10)
kmn1 <- kmeans(dat , 6 , nstart = 10)
kmn1
plot(dat , col = (kmn1$cluster +1) , main = "Clustering with 6 clusters " , pch =20,cex = 2)
