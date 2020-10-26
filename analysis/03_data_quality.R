library(Amelia)

missmap(train, legend = T, col = c('yellow','black'), main = "Creditworthiness Missingness Map")
train_NA<-data.frame(colSums(is.na(train)))

#Drop Variable with more that 50% missing values
train<-train%>%select(-`Duration-in-Current-address`)

for (i in (1:length(train$`Age-years`)))
{
  if(is.na(train$`Age-years`[i])==T){
    train$`Age-years`[i]<- median(train$`Age-years`,na.rm = T)}
  else{
    train$`Age-years`[i]
  } }


