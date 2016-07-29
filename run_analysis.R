########################################## Merging Starts###########################################################
##Merges the training and the test sets to create one data set.

TrainFiles= list.files(path="C:\\Users\\nzpb1414\\Data Science\\Coursera\\Data Cleaning\\Project\\UCI HAR Dataset\\UCI HAR Dataset\\train")
TestFiles= list.files(path="C:\\Users\\nzpb1414\\Data Science\\Coursera\\Data Cleaning\\Project\\UCI HAR Dataset\\UCI HAR Dataset\\test")

for (i in 1:(length(TrainFiles))) {
  filename<-substr(TrainFiles[i], 0, nchar(TrainFiles[i])-9)
  setwd("C:\\Users\\nzpb1414\\Data Science\\Coursera\\Data Cleaning\\Project\\UCI HAR Dataset\\UCI HAR Dataset\\train")
  Trainfile<- as.matrix(read.table(TrainFiles[i]))
  setwd("C:\\Users\\nzpb1414\\Data Science\\Coursera\\Data Cleaning\\Project\\UCI HAR Dataset\\UCI HAR Dataset\\test")
  Testfile<- as.matrix(read.table(TestFiles[i]))
  setwd("C:\\Users\\nzpb1414\\Data Science\\Coursera\\Data Cleaning\\Project\\UCI HAR Dataset\\UCI HAR Dataset\\tidy")
  Tidyfile<- rbind2(Trainfile,Testfile)
  write.csv(Tidyfile, file=paste("C:\\Users\\nzpb1414\\Data Science\\Coursera\\Data Cleaning\\Project\\UCI HAR Dataset\\UCI HAR Dataset\\tidy\\",filename,"tidy.csv"),sep=",")
  
}

########################################## Merging Ends###########################################################

setwd("C:\\Users\\nzpb1414\\Data Science\\Coursera\\Data Cleaning\\Project\\UCI HAR Dataset\\UCI HAR Dataset\\tidy")
TidyFiles= list.files(path="C:\\Users\\nzpb1414\\Data Science\\Coursera\\Data Cleaning\\Project\\UCI HAR Dataset\\UCI HAR Dataset\\tidy")

for (i in 1:(length(TidyFiles))) {
  filename<-substr(TidyFiles[i], 0, nchar(TidyFiles[i])-8)
  setwd("C:\\Users\\nzpb1414\\Data Science\\Coursera\\Data Cleaning\\Project\\UCI HAR Dataset\\UCI HAR Dataset\\tidy")
  Tidyfile<- as.matrix(read.csv(TidyFiles[i], sep=",",header=FALSE))
  measures<-matrix(ncol=2)
  filemeasure<-vector()
  for( j in 1: ncol(Tidyfile))
  {
    filemeasure<-vector()
    stndrdev=sd(Tidyfile[,j])
    mean=mean(Tidyfile[,j])
    filemeasure<-c(mean,stndrdev)
    measures<-rbind(measures,filemeasure)
        
  }
  setwd("C:\\Users\\nzpb1414\\Data Science\\Coursera\\Data Cleaning\\Project\\UCI HAR Dataset\\UCI HAR Dataset\\measures")
  write.csv(measures, file=paste("C:\\Users\\nzpb1414\\Data Science\\Coursera\\Data Cleaning\\Project\\UCI HAR Dataset\\UCI HAR Dataset\\measures\\",filename,"_measure.csv"),sep=",")
  
}
