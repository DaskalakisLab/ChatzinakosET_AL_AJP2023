library(ComplexHeatmap)
library(circlize)


load(/path_to/mat1.object)

col_fun=colorRamp2(c(min(mat1),max(mat1)), c("white","red"))


for(i in 1:9){
  
  for(j in 1:9){
    
    
    if(j==i){mat1[i,j]=NA}
    
  }
  
}


Heatmap(mat1,
        
                    cell_fun = function(j, i, x, y, width, height, fill) {

          if(is.na(mat1[i,j])==F){

           grid.text(round(mat1[i,j],digits = 3), x, y, gp = gpar(fontsize = 16,col="black"))
          
          }

        },show_heatmap_legend=F,width = unit(22, "cm"),na_col = "grey",rect_gp = gpar(col = "black", lwd = 1),col=col_fun,row_names_gp = gpar(fontsize = 30),column_names_gp =gpar(fontsize = 30) )
















