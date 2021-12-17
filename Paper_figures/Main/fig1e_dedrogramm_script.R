library(Seurat)
library(dplyr)
library(cowplot)
require(data.table)
library(corrplot)
require(gplots)
require(RColorBrewer)
library(circlize)
library(ComplexHeatmap)
library(ggplot2)
library(ggdendro)
library(ggpubr)
library(preprocessCore)
library(dendextend)

load(/path_to/dfin.object)

hc <- hclust(dist(dfin), "ward.D2")
p1=ggdendrogram(hc, rotate = TRUE, size = 2)



p1+
  coord_flip() +
  theme_dendro()
dend <- dfin%>% dist %>% hclust (method="ward.D2") %>% as.dendrogram


par(mar=c(1,1,1,15))
ppp<-dend %>% plot(horiz=TRUE, axes=FALSE)
