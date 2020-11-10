class(train)
dim(train)
names(train)
glimpse(train)
## variable names are in quotes and can be problematic



colnames(train)<-make.names(colnames(train))
glimpse(train)

## same is applied to dependent Variable

train$Credit.Application.Result <-make.names(train$Credit.Application.Result)
colnames(test)<-make.names(colnames(test))


head(train)%>%View()

train%>%
  group_by(Purpose)%>%
  top_n(5, wt = `Credit.Amount`)%>%View()
