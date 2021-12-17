library(Seurat)
library(dplyr)
library(cowplot)
require(data.table)
library(ggplot2)


load("path_to/dfin.object")

a1=c("coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral","coral")

a2=c("coral","coral","coral","coral","coral","coral","coral","coral","coral","tan3","tan3","tan3","tan3","tan3","tan3","tan3","coral","coral","coral","coral","coral","coral","coral","coral","mediumorchid1","darkolivegreen4","darkturquoise","pink","pink","mediumseagreen","dodgerblue")

p1<-ggplot(dfin, aes(x=genes, y=clusters,col=color_mat)) + xlab("")+ylab("")+
  geom_point(aes(size=cell_size)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1,colour = a1,size=18),axis.text.y = element_text(colour = a2,size=18),text = element_text(size = 18)) +
  labs(col = "Avg. exp.\n z-scores")+labs(size="Pct. exp.")
p1


