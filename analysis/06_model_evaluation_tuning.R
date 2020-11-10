set.seed(123)


## Setting the tuning parameters
fitControl <- trainControl(## 10-fold CV
  method = "repeatedcv",
  number = 10,
  #classProbs = T,
  ## repeated ten times
  repeats = 10)

fitControl2<- trainControl(## 10-fold CV
  method = "repeatedcv",
  number = 10,
  classProbs = T,
  ## repeated ten times
  repeats = 10,
  summaryFunction = twoClassSummary)

##Data split
train_index <- createDataPartition(train_new$Credit.Application.Result,times = 1, p = 0.7, list = F)
train_set <- train_new[train_index,]
test_set <- train_new[-train_index,]




#Logistic regression
glmFit <- train(Credit.Application.Result ~ .,
                method = 'glm',
                trControl = fitControl,
                data = train_set)
                #data = train_new[,c(1,3,4,6,7,11,12)])


summary(glmFit)

glmFit$finalModel
glmFit

#ROC as performance metric
glmFit2 <- train(Credit.Application.Result ~ .,
                method = 'glm',
                metric = 'ROC',
                trControl = fitControl2,
                data = train_new)

glmFit2$finalModel
glmFit2

glm.pred <- predict(glmFit,test_set)
cm<-confusionMatrix(table(glm.pred,test_set$Credit.Application.Result))   
cm
cm$byClass


#Decision Tree
treeFit <- train(Credit.Application.Result ~.,
               method = "rpart",
               trControl = fitControl,
               tuneGrid = data.frame(cp = seq(0.0, 0.1, len = 25)),
               data = train_set)

treeFit$finalModel
treeFit
treeFit$bestTune
plot(treeFit)
plot(varImp(treeFit))


#####ROC metric
treeFit2 <- train(Credit.Application.Result ~.,
                 method = "rpart",
                 trControl = fitControl2,
                 metric ='ROC',
                 tuneGrid = data.frame(cp = seq(0.0, 0.1, len = 25)),
                 data = train_set)

treeFit2$finalModel
treeFit2
plot(treeFit2)

tree.pred <- predict(treeFit,test_set)
cm2<-confusionMatrix(table(tree.pred,test_set$Credit.Application.Result))   
cm2


##RandomForest
tuneRF(train_new[,c(2:16)],train_new$Credit.Application.Result,
       ntreeTry = 1500,stepFactor = 1, improve = 0.05, trace = T)
       

rfFit<- train(Credit.Application.Result ~.,
              method = 'rf',
              importance =T,
              trControl = fitControl,
              tuneLength = 10,
              data = train_set)

summary(rfFit)
rfFit$finalModel
rfFit
plot(rfFit)
plot(varImp(rfFit,10))

## ROC metric
rfFit2<- train(Credit.Application.Result ~.,
              method = 'rf',
              trControl = fitControl2,
              tuneLength = 10,
              metric ='ROC',
              data = train_set)


rfFit2$finalModel
rfFit2

##Confusion matrix
rf.pred <- predict(rfFit,test_set)
cm3<-confusionMatrix(table(rf.pred,test_set$Credit.Application.Result))   
cm3


# Boosted Tree
tune.Grid <-  expand.grid(interaction.depth = c(1, 5, 9), 
                          n.trees = (30:500) ,
                          shrinkage = 0.1,
                          n.minobsinnode = 15)
gbmFit<- train(Credit.Application.Result ~., 
               method = 'gbm',
               trControl = fitControl,
               tuneGrid = tune.Grid,
               data = train_set)

summary(gbmFit)
gbmFit$bestTune
plot(gbmFit)
gbmFit
plot(varImp(gbmFit,10))

# ROC metric
gbmFit2<- train(Credit.Application.Result ~., 
               method = 'gbm',
               trControl = fitControl2,
               tuneGrid = tune.Grid,
               metric ='ROC',
               verbose = FALSE,
               data = train_set)

gbmFit2$finalModel
gbmFit2
gbmFit2$bestTune
#

# Confusion matrix

gbm.pred <- predict(gbmFit,test_set)
cm4<-confusionMatrix(table(gbm.pred,test_set$Credit.Application.Result))     
cm4
