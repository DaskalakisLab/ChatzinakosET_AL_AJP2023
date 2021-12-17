### RUN ELASTIC NET MODEL TO BUILD DATABASE.

library(data.table)
setwd("/PHShome/hs541/PEC/")
source("/PHShome/hs541/dlpfc_predictdb/UberXcan/gtex_v7_nested_cv_elnet.R")
"%&%" <- function(a,b) paste(a,b, sep='')

chargs=commandArgs()
str.look<-"-arg1="
i.look<-c(1:length(chargs))[substr(chargs,1,nchar(str.look))==str.look]
arg1<-as.character(substr(chargs[i.look],nchar(str.look)+1,nchar(chargs[i.look])))
chrom <- as.numeric(unlist(strsplit(arg1,',')))

for (i_chrom in chrom) {

  snp_annot_file <- "genotype/PEC.chr" %&% i_chrom %&% ".snp_annotation.pruned.txt"
  gene_annot_file <- "ref/gencode.v33lift37.patched_contigs.parsed.txt"

  genotype_file <- "genotype/PEC.chr" %&% i_chrom %&% ".fixed.cc.dose.txt.gz"
  #expression_file <- "expression/PEC.expression.renamed.txt"
  expression_file <- "expression/PEC.expression.renamed.txt"
  #covariates_file <- "covariates/PEC.covs.complete.60.txt"
  covariates_file <- "covariates/PEC.covs.complete.10.txt"
  #snp_selection_filt <-
  prefix <- "nested_cv.10PF"

  main(snp_annot_file, gene_annot_file, genotype_file, expression_file,
    covariates_file, as.numeric(i_chrom), prefix, null_testing = FALSE)

}

### END ###
