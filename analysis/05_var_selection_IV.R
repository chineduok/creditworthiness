# Detecting zero and near-zero variance predictors
char.train <- train[,c(1,2,4,5,7,8,10,11,13,14,15,16,17,18,19)]

nzv <- nearZeroVar(char.train, saveMetrics = T)

nzv%>%filter(nzv==T)


#Bar plots showing low variability
train%>%
  select(Foreign.Worker,Concurrent.Credits,
         Occupation)%>%
  gather(key ="var", value ="value")%>%
  ggplot(aes(x = value))+
  geom_bar(color ='black') +
  facet_wrap(~var,scales = 'free') +
  theme_bw()

# Drop variables with the zero or near zero variance predictors and telephone number
nzv<-nearZeroVar(train)
train_new<-train[,-nzv]

# Checking the Informationa Value of variables
IV_limit <- iv.mult(train_new,"Credit.Application.Result",TRUE)%>%filter(InformationValue<0.5 & InformationValue>0.1)

IV_limit

