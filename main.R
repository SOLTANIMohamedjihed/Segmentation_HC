
library(openxlsx)
library(factoextra)

Dat <- read.xlsx("Segmentation.xlsx")

ScDat = scale(Dat[,-c(1)], center = TRUE, scale = TRUE)


## Optimal number of cluster
## # Average silhouette for kmeans

fviz_nbclust(ScDat, kmeans, method = "wss") +
geom_vline(xintercept = 4, linetype = 2)

km.res <- kmeans(ScDat, 4)

fviz_cluster(km.res, data = Dat[,-c(1)],
             palette = c("#00AFBB","#2E9FDF", "#E7B800", "#FC4E07"),
             ggtheme = theme_minimal(),
             main = "Partitioning Clustering Plot"
             )

# H.C

res <- hcut(ScDat)
fviz_dend(res, rect = TRUE, cex = 0.5, k_colors = c("#00AFBB","#2E9FDF", "#E7B800", "#FC4E07"))