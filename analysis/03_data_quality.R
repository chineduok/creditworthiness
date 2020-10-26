na_plot<-missmap(train, legend = T, col = c('yellow','black'), main = "Creditworthiness Missingness Map")
save(na_plot, file = "fig/na_plot.fig")
train_NA<-data.frame(colSums(is.na(train)))
save(train_NA, file="fig/train_NA.fig")
#Drop Variable with more that 50% missing values
train<-train%>%select(-`Duration-in-Current-address`)

for (i in (1:length(train$`Age-years`)))
{
  if(is.na(train$`Age-years`[i])==T){
    train$`Age-years`[i]<- median(train$`Age-years`,na.rm = T)}
  else{
    train$`Age-years`[i]
  } }


## Factor Encoding
unique(train$`Account-Balance`)
train$`Account-Balance`<- factor(train$`Account-Balance`)

unique(train$`Payment-Status-of-Previous-Credit`)
train$`Payment-Status-of-Previous-Credit`<-factor(train$`Payment-Status-of-Previous-Credit`)

unique(train$Purpose)
train$Purpose <- factor(train$Purpose)

unique(train$`Length-of-current-employment`)
train$`Length-of-current-employment`<- factor(train$`Length-of-current-employment`)

unique(train$Guarantors)
train$Guarantors <- factor(train$Guarantors)

unique(train$`Concurrent-Credits`)# has only one factor/value

unique(train$`No-of-Credits-at-this-Bank`)
train$`No-of-Credits-at-this-Bank`<-factor(train$`No-of-Credits-at-this-Bank`)

unique(train$`Value-Savings-Stocks`)
train$`Value-Savings-Stocks`<-factor(train$`Value-Savings-Stocks`,levels = c("None","< £100","£100-£1000"))

unique(train$`Foreign-Worker`)
train$`Foreign-Worker`<- factor(train$`Foreign-Worker`)

train$`Credit-Application-Result`<- factor(train$`Credit-Application-Result`)

train$`Type-of-apartment`<- factor(train$`Type-of-apartment`)

train$`Most-valuable-available-asset`<-factor(train$`Most-valuable-available-asset`)

unique(train$Occupation)

unique(train$`Type-of-apartment`)
table(train$`Type-of-apartment`)

summary(train) 


glimpse(train)
save(train, file = "rda/train.rda")


