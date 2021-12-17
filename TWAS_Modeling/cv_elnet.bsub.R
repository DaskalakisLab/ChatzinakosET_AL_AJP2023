pwd <- getwd()

max.jobs <- 100
outfile <- paste(pwd,"/logs/02_cv_elnet.bsub",sep="")

cat(outfile,"\n")
k <- 1
offset <- 1

sets <- list()
sets[['set1']] <- c(1:22)




for(i in 1:length(sets)) {

  arg1 <- as.character(paste(sets[[i]],collapse=','))

  write("#!/bin/bash ",outfile,append=F)
  write(paste("#BSUB -o 02_logs/%so_set10",i,".txt",sep=""),outfile,append=T)
  write(paste("#BSUB -e 02_logs/%se_set10",i,".txt",sep=""),outfile,append=T)
  write(paste("#BSUB -q big",sep=""),outfile,append=T)
  write(paste("#BSUB -J set1",i,sep=""),outfile,append=T)

  #Build R CMD BATCH FILE command.
  write(paste("path_to_R CMD BATCH --no-restore --no-save --no-readline -iseed=",i,
  " -arg1=",arg1,

  " ",pwd,"/cv_elnet.R",
  " ",pwd,"/logs/out_set1",i,".txt",sep=""),

  outfile,append=T)
  write("",outfile,append=T)

  njobs <- as.numeric(system("bjobs -u user_name | wc -l",intern=T,wait=T))

  while(njobs > max.jobs){
    system("sleep 250", wait=T)
    njobs <- as.numeric(system("bjobs -u user_name | wc -l",intern=T,wait=T))
    print(paste('Checked at', Sys.time()))
  }

  system(paste("bsub < ",outfile),wait=T)

  cat("Chrom", k, "submitted. \n")
  k <- k+1

}
