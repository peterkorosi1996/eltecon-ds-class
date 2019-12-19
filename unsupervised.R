library(ggplot2)
library(data.table)

sales <- fread("C:/Users/Peti/Documents/eltecon-ds/sales_data_for_clustering.csv")

#nezzuk csak az elso husz sort, hogy szepen latsszon az abra:
sales <- sales[1:20,.(product_id,price)]

hc_complete <- hclust(dist(sales), method = "complete")
hc_average <- hclust(dist(sales), method = "average")
hc_single <- hclust(dist(sales), method = "single")

par(mfrow = c(1,3))
plot(hc_complete, main = "Complete linkage", xlab="", ylab="" )
plot(hc_average, main = "Average linkage", xlab="", ylab="")
plot(hc_single, main = "Single linkage", xlab="", ylab="")

cutree(hc_complete, k =2)
cutree(hc_average, k = 2)
cutree(hc_single, k = 2)

cutree(hc_complete, h = 5)
cutree(hc_average, h = 4)
cutree(hc_single, h = 1.4)

x_scaled <- scale(x)
par(mfrow = c(1,1))
plot(hclust(dist(x_scaled), method = "complete"),
     main = "Hierarchical clustering with scaled features")

set.seed(5)
x <- matrix(rnorm(30 * 3), ncol = 3)
dd <- as.dist(1 - cor(t(x)))
plot(hclust(dd, method = "complete"),
     main = "Complete linkage with correlation-based distance",
     xlab = "", sub = "")