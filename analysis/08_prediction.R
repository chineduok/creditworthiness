head(test)
names(train_new)

# Select the predictor variables in the test set.
pred_var <- names(train_new[-1])
pred_var

test_new<- test[,pred_var]
names(test_new)

glimpse(test_new)
glimpse(train_new)
names(test_new)


glimpse(test_new)

unique(test_new$Account.Balance)
test_new$Account.Balance<-factor(test_new$Account.Balance)
test_new$Payment.Status.of.Previous.Credit <-factor(test_new$Payment.Status.of.Previous.Credit)
test_new$Purpose <- factor(test_new$Purpose)
test_new$Value.Savings.Stocks <- factor(test_new$Value.Savings.Stocks)
test_new$Length.of.current.employment <-factor(test_new$Length.of.current.employment)
test_new$Guarantors <-factor(test_new$Guarantors)
test_new$Type.of.apartment <- factor(test_new$Type.of.apartment)
test_new$No.of.Credits.at.this.Bank <-factor(test_new$No.of.Credits.at.this.Bank)
test_new$Most.valuable.available.asset <-factor(test_new$Most.valuable.available.asset)

score <- predict(rfFit, newdata =test_new)
score
